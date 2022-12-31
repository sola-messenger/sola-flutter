import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:just_audio/just_audio.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sola/common/extension/event_extension.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/content_dialog.dart';


class AudioPlayerClip extends StatefulWidget {
  final Color color;
  final Event event;

  static String? currentId;

  static const int wavesCount = 40;

  const AudioPlayerClip(this.event, {this.color = Colors.black, Key? key})
      : super(key: key);

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

enum AudioPlayerStatus { notDownloaded, downloading, downloaded }

class AudioPlayerState extends State<AudioPlayerClip> {
  AudioPlayerStatus status = AudioPlayerStatus.notDownloaded;
  final AudioPlayer audioPlayer = AudioPlayer();

  StreamSubscription? onAudioPositionChanged;
  StreamSubscription? onDurationChanged;
  StreamSubscription? onPlayerStateChanged;
  StreamSubscription? onPlayerError;

  String? statusText;
  int currentPosition = 0;
  double maxPosition = 0;

  File? audioFile;

  @override
  void dispose() {
    if (audioPlayer.playerState.playing) {
      audioPlayer.stop();
    }
    onAudioPositionChanged?.cancel();
    onDurationChanged?.cancel();
    onPlayerStateChanged?.cancel();
    onPlayerError?.cancel();

    super.dispose();
  }

  Future<void> _downloadAction() async {
    if (status != AudioPlayerStatus.notDownloaded) return;
    setState(() => status = AudioPlayerStatus.downloading);
    try {
      final matrixFile = await widget.event.downloadAndDecryptAttachment();
      final tempDir = await getTemporaryDirectory();
      final fileName = Uri.encodeComponent(
          widget.event.attachmentOrThumbnailMxcUrl()!.pathSegments.last);
      final file = File('${tempDir.path}/${fileName}_${matrixFile.name}');
      await file.writeAsBytes(matrixFile.bytes);

      setState(() {
        audioFile = file;
        status = AudioPlayerStatus.downloaded;
      });
      _playAction();
    } catch (e, s) {
      Logs().v('Could not download audio file', e, s);
      DialogUtils.showDialog(child: ContentDialog(content: e.toString()));

    }
  }

  void _playAction() async {
    if (AudioPlayerClip.currentId != widget.event.eventId) {
      if (AudioPlayerClip.currentId != null) {
        if (audioPlayer.playerState.playing) {
          await audioPlayer.stop();
          setState(() {});
        }
      }
      AudioPlayerClip.currentId = widget.event.eventId;
    }
    if (audioPlayer.playerState.playing) {
      await audioPlayer.pause();
      return;
    } else if (audioPlayer.position != Duration.zero) {
      await audioPlayer.play();
      return;
    }

    onAudioPositionChanged ??= audioPlayer.positionStream.listen((state) {
      setState(() {
        statusText =
            '${state.inMinutes.toString().padLeft(2, '0')}:${(state.inSeconds % 60).toString().padLeft(2, '0')}';
        currentPosition = ((state.inMilliseconds.toDouble() / maxPosition) *
                AudioPlayerClip.wavesCount)
            .round();
      });
    });
    onDurationChanged ??= audioPlayer.durationStream.listen((max) => max == null
        ? null
        : setState(() => maxPosition = max.inMilliseconds.toDouble()));
    onPlayerStateChanged ??=
        audioPlayer.playingStream.listen((_) => setState(() {}));
    audioPlayer.setFilePath(audioFile!.path);
    audioPlayer.play().catchError((e, s) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(L10n.of(context)!.oopsSomethingWentWrong),
        ),
      );
      Logs().w('Error while playing audio', e, s);
    });
  }

  static const double buttonSize = 36;

  String? get _durationString {
    final durationInt = widget.event.content
        .tryGetMap<String, dynamic>('info')
        ?.tryGet<int>('duration');
    if (durationInt == null) return null;
    final duration = Duration(milliseconds: durationInt);
    return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  List<int> _getWaveform() {
    final eventWaveForm = widget.event.content
        .tryGetMap<String, dynamic>('org.matrix.msc1767.audio')
        ?.tryGetList<int>('waveform');
    if (eventWaveForm == null) {
      return List<int>.filled(AudioPlayerClip.wavesCount, 500);
    }
    while (eventWaveForm.length < AudioPlayerClip.wavesCount) {
      for (var i = 0; i < eventWaveForm.length; i = i + 2) {
        eventWaveForm.insert(i, eventWaveForm[i]);
      }
    }
    var i = 0;
    final step = (eventWaveForm.length / AudioPlayerClip.wavesCount).round();
    while (eventWaveForm.length > AudioPlayerClip.wavesCount) {
      eventWaveForm.removeAt(i);
      i = (i + step) % AudioPlayerClip.wavesCount;
    }
    return eventWaveForm.map((i) => i > 1024 ? 1024 : i).toList();
  }

  late final List<int> waveform;

  @override
  void initState() {
    super.initState();
    waveform = _getWaveform();
  }

  @override
  Widget build(BuildContext context) {
    final statusText = this.statusText ??= _durationString ?? '00:00';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: status == AudioPlayerStatus.downloading
                ? CircularProgressIndicator(strokeWidth: 2, color: widget.color)
                : InkWell(
                    borderRadius: BorderRadius.circular(64),
                    child: Material(
                      color: widget.color.withAlpha(64),
                      borderRadius: BorderRadius.circular(64),
                      child: Icon(
                        audioPlayer.playerState.playing
                            ? Icons.pause_outlined
                            : Icons.play_arrow_outlined,
                        color: widget.color,
                      ),
                    ),
                    onLongPress: () => widget.event.saveFile(context),
                    onTap: () {
                      if (status == AudioPlayerStatus.downloaded) {
                        _playAction();
                      } else {
                        _downloadAction();
                      }
                    },
                  ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              children: [
                for (var i = 0; i < AudioPlayerClip.wavesCount; i++)
                  Expanded(
                    child: InkWell(
                      onTap: () => audioPlayer.seek(Duration(
                          milliseconds:
                              (maxPosition / AudioPlayerClip.wavesCount)
                                      .round() *
                                  i)),
                      child: Container(
                        height: 32,
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: currentPosition > i ? 1 : 0.5,
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.circular(64),
                              ),
                              height: 32 * (waveform[i] / 1024)),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            alignment: Alignment.centerRight,
            width: 42,
            child: Text(
              statusText,
              style: TextStyle(
                color: widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
