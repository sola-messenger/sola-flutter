// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix_link_text/link_text.dart';
import 'package:sola/common/app_constants.dart';
import 'package:sola/common/extension/date_time_extension.dart';
import 'package:sola/common/matrix_locals.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/audio_player_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/cute_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/html_message.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/image_bubble_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/map_clip.dart';

// Project imports:
import 'package:sola/pages/chat_modular/chat_detail/views/sticker_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/video_player_clip.dart';
import 'package:sola/r.dart';

import '../../../../common/widgets/popu/menu_popup.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'avatar.dart';
import 'message_download_content.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatMessageContent extends StatelessWidget {
  final List<MenuPopupItemEntity> menus;
  final Event event;
  final void Function(Event)? onInfoTab;
  final Timeline timeline;

  const ChatMessageContent(
      {super.key,
      required this.menus,
      required this.event,
      this.onInfoTab,
      required this.timeline});

  bool get isOwen => event.senderId == Get.find<ClientService>().client.userID;

  void _verifyOrRequestKey(BuildContext context) async {
    final l10n = L10n.of(context)!;
    if (event.content['can_request_session'] != true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        event.type == EventTypes.Encrypted
            ? l10n.needPantalaimonWarning
            : event.calcLocalizedBodyFallback(
                MatrixLocals(l10n),
              ),
      )));
      return;
    }
    final client = Get.find<ClientService>().client;
    if (client.isUnknownSession && client.encryption!.crossSigning.enabled) {
      //加米
      // final success = await BootstrapDialog(
      //   client: client,
      // ).show(context);
      // if (success != true) return;
    }
    event.requestKey();
    final sender = event.senderFromMemoryOrFallback;
    await showModalBottomSheet(
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(onPressed: Navigator.of(context).pop),
          title: Text(
            l10n.whyIsThisMessageEncrypted,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Avatar(
                  mxContent: sender.avatarUrl,
                  name: sender.calcDisplayname(),
                ),
                title: Text(sender.calcDisplayname()),
                subtitle: Text(event.originServerTs.localizedTime(context)),
                trailing: const Icon(Icons.lock_outlined),
              ),
              const Divider(),
              Text(
                event.calcLocalizedBodyFallback(
                  MatrixLocals(l10n),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();
    TextStyle textStyle = const TextStyle(
      fontSize: 15,
      color: AppColors.textBlackColor,
      height: 22 / 15,
    );

    switch (event.type) {
      case EventTypes.Message:
      case EventTypes.Encrypted:
      case EventTypes.Sticker:
        switch (event.messageType) {
          case MessageTypes.Image:
            child = ImageBubbleClip(
              event,
              width: 112,
              height: 85,
              maxSize: true,
              fit: BoxFit.fill,
            );
            break;
          case MessageTypes.Sticker:
            if (event.redacted) continue textmessage;
            child = StickerClip(event);
            break;
          case CuteEventContent.eventType:
            child = CuteClip(event);
            break;
          case MessageTypes.Audio:
            child = AudioPlayerClip(
              event,
            );
            break;
          case MessageTypes.Video:
            child = VideoPlayerClip(event);
            break;
          case MessageTypes.File:
            child = MessageDownloadContent(event);
            break;
          case MessageTypes.Text:
          case MessageTypes.Notice:
          case MessageTypes.Emote:
            if (AppConstants.renderHtml &&
                !event.redacted &&
                event.isRichMessage) {
              var html = event.formattedText;
              if (event.messageType == MessageTypes.Emote) {
                html = '* $html';
              }
              // final bigEmotes = event.onlyEmotes &&
              //     event.numberEmotes > 0 &&
              //     event.numberEmotes <= 10;
              child = HtmlMessage(
                html: html,
                defaultTextStyle: textStyle,
                linkStyle: textStyle.copyWith(
                  color: AppColors.mainBlueColor,
                  decoration: TextDecoration.underline,
                ),
                room: event.room,
                // emoteSize: bigEmotes ? fontSize * 3 : fontSize * 1.5,
              );
            }
            // else we fall through to the normal message rendering
            continue textmessage;
          case MessageTypes.BadEncrypted:
          case EventTypes.Encrypted:
            child = _ButtonContent(
              textColor: Colors.black,
              onPressed: () => _verifyOrRequestKey(context),
              icon: const Icon(Icons.lock_outline),
              label: L10n.of(context)!.encrypted,
            );
            break;
          case MessageTypes.Location:
            final geoUri =
                Uri.tryParse(event.content.tryGet<String>('geo_uri')!);
            if (geoUri != null && geoUri.scheme == 'geo') {
              final latlng = geoUri.path
                  .split(';')
                  .first
                  .split(',')
                  .map((s) => double.tryParse(s))
                  .toList();
              if (latlng.length == 2 &&
                  latlng.first != null &&
                  latlng.last != null) {
                child = Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapClip(
                      latitude: latlng.first!,
                      longitude: latlng.last!,
                    ),
                    const SizedBox(height: 6),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.location_on_outlined,
                          color: AppColors.mainBlueColor),
                      onPressed: () {
                        launchUrl(geoUri);
                      },
                      label: Text(
                        L10n.of(context)!.openInMaps,
                        style: textStyle,
                      ),
                    ),
                  ],
                );
              }
              break;
            }
            continue textmessage;
          case MessageTypes.None:
          textmessage:
          default:
            if (event.redacted) {
              child = FutureBuilder<User?>(
                  future: event.fetchSenderUser(),
                  builder: (context, snapshot) {
                    return _ButtonContent(
                      label: L10n.of(context)!.redactedAnEvent(snapshot.data
                              ?.calcDisplayname() ??
                          event.senderFromMemoryOrFallback.calcDisplayname()),
                      icon: const Icon(Icons.delete_outlined),
                      textColor: Colors.black,
                      onPressed: () => onInfoTab!(event),
                    );
                  });
            } else {
              // final bigEmotes = event.onlyEmotes &&
              //     event.numberEmotes > 0 &&
              //     event.numberEmotes <= 10;
              child = FutureBuilder<String>(
                  future: event.calcLocalizedBody(
                      MatrixLocals(L10n.of(context)!),
                      hideReply: true),
                  builder: (context, snapshot) {
                    bool isEdit = event.hasAggregatedEvents(
                        timeline, RelationshipTypes.edit);
                    return RichText(text:
                    TextSpan(
                      children: [
                        WidgetSpan(child: LinkText(
                          text:
                          snapshot.data ?? event.calcLocalizedBodyFallback(MatrixLocals(L10n.of(context)!), hideReply: true),
                          textStyle: textStyle.copyWith(
                            decoration:
                            event.redacted ? TextDecoration.lineThrough : null,
                          ),
                          linkStyle: textStyle.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.mainBlueColor,
                          ),
                          onLinkTap: (url) => launchUrl(Uri.parse(url)),
                        )),
                        if(isEdit)
                          const TextSpan(
                            text: '（edited）',
                            style: TextStyle(
                              color: AppColors.mainBlueColor,
                              fontSize: 8,
                              height: 12/8,
                            )
                          )
                      ]
                    ));
                  });
            }
        }
        break;
      case EventTypes.CallInvite:
        child = FutureBuilder<User?>(
            future: event.fetchSenderUser(),
            builder: (context, snapshot) {
              return _ButtonContent(
                label: L10n.of(context)!.startedACall(
                    snapshot.data?.calcDisplayname() ??
                        event.senderFromMemoryOrFallback.calcDisplayname()),
                icon: const Icon(Icons.phone_outlined),
                textColor: Colors.black,
                onPressed: () => onInfoTab!(event),
              );
            });
        break;
      default:
        child = FutureBuilder<User?>(
            future: event.fetchSenderUser(),
            builder: (context, snapshot) {
              return _ButtonContent(
                label: L10n.of(context)!.userSentUnknownEvent(
                    snapshot.data?.calcDisplayname() ??
                        event.senderFromMemoryOrFallback.calcDisplayname(),
                    event.type),
                icon: const Icon(Icons.info_outlined),
                textColor: Colors.black,
                onPressed: () => onInfoTab!(event),
              );
            });
        break;
    }
    return MenuPopup(
        menuItem: menus,
        menuPopupType: MenuPopupType.messageList,
        child: child);
  }
}

class _ButtonContent extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Icon icon;
  final Color? textColor;

  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.textColor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label, overflow: TextOverflow.ellipsis),
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: Colors.white.withAlpha(64),
      ),
    );
  }
}

enum MessageStateType {
  read,
  error,
  time,
  done,
}

class MessageStateInherited extends InheritedWidget {
  final VoidCallback onResend;
  final MessageStateType type;
  final bool isSelectMode;

  const MessageStateInherited({
    Key? key,
    required this.onResend,
    required this.type,
    required this.isSelectMode,
    required Widget child,
  }) : super(key: key, child: child);

  static MessageStateInherited of(BuildContext context) {
    final MessageStateInherited? result =
        context.dependOnInheritedWidgetOfExactType<MessageStateInherited>();
    assert(result != null, 'No MessageStateInherited found in context');
    return result!;
  }

  Widget buildSelectIcon() {
    return isSelectMode
        ? Image.asset(
            R.assetsIconUnselectIcon,
            width: 16,
            height: 16,
          )
        : Container();
  }

  Widget buildIcon() {
    Widget child = const SizedBox();
    switch (type) {
      case MessageStateType.read:
        child = Image.asset(R.assetsIconMakeAsReadIcon);
        break;
      case MessageStateType.error:
        child = Image.asset(R.assetsIconInfoIcon);
        break;
      case MessageStateType.time:
        child = Image.asset(R.assetsIconTimeIcon);
        break;
      case MessageStateType.done:
        child = Image.asset(R.assetsIconDoneIcon);
        break;
    }
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.only(
          right: 8,
          top: 17,
        ),
        child: child,
      ),
    );
  }

  @override
  bool updateShouldNotify(MessageStateInherited old) {
    return old.onResend != onResend ||
        old.type != type ||
        old.isSelectMode != isSelectMode;
  }
}
