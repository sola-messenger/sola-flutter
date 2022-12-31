import 'package:flutter/material.dart';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:get/get.dart';
import 'package:sola/pages/chat_modular/chat_detail/chat_detail_controller.dart';

class ChatEmojiPicker extends StatelessWidget {
  final ChatDetailController controller;

  const ChatEmojiPicker(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: controller.isShowEmojiPicker.value
            ? MediaQuery.of(context).size.height / 3
            : 0,
        child: controller.isShowEmojiPicker.value
            ? EmojiPicker(
                onEmojiSelected: controller.onEmojiSelected,
                onBackspacePressed: controller.emojiPickerBackspace,
              )
            : null,
      ),
    );
  }
}
