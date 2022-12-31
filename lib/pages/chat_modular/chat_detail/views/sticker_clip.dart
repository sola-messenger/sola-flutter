import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/app_constants.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/image_bubble_clip.dart';

class StickerClip extends StatefulWidget {
  final Event event;

  const StickerClip(this.event, {Key? key}) : super(key: key);

  @override
  StickerClipState createState() => StickerClipState();
}

class StickerClipState extends State<StickerClip> {
  bool? animated;

  @override
  Widget build(BuildContext context) {
    return ImageBubbleClip(
      widget.event,
      width: 400,
      height: 400,
      fit: BoxFit.contain,
      onTap: () {
        setState(() => animated = true);
        showOkAlertDialog(
          context: context,
          message: widget.event.body,
          okLabel: L10n.of(context)!.ok,
        );
      },
      animated: animated ?? AppConstants.autoplayImages,
    );
  }
}
