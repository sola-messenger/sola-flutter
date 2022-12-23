// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';
import 'package:sola/r.dart';

class VoiceClip extends StatelessWidget {
  final String avatar;
  final String content;
  final bool isOwen;
  final VoidCallback onTapAvatar;

  const VoiceClip(
      {super.key,
      required this.avatar,
      required this.content,
      required this.isOwen,
      required this.onTapAvatar});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const SizedBox(
        width: 6,
      ),
      InkWell(
        onTap: onTapAvatar,
        child: Ink(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
      const SizedBox(
        width: 6,
      ),
      Container(
        decoration: BoxDecoration(
          color: isOwen ? const Color(0xFFCDE8F6) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:
                isOwen ? const Radius.circular(16) : const Radius.circular(0),
            bottomRight:
                isOwen ? const Radius.circular(0) : const Radius.circular(16),
          ),
        ),
        constraints: const BoxConstraints(
          maxWidth: 250,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Container(
          width: 120,
          alignment: isOwen ? Alignment.centerRight : Alignment.centerLeft,
          child: Image.asset(
            R.assetsIconVoiceClipIcon,
            width: 15,
            height: 15,
          ),
        ),
      ),
      Container(
        height: 40,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          right: isOwen ? 6 : 0,
          left: isOwen ? 0 : 6,
        ),
        child: const Text(
          '7“',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 17 / 11,
            color: Color(0xFF7B7B7B),
          ),
        ),
      ),
      if (isOwen) MessageStateInherited.of(context).buildIcon(),
    ];

    if (isOwen) {
      // 右边
      children = children.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isOwen ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: MessageStateInherited.of(context).buildSelectIcon()),
          ...children,
        ],
      ),
    );
  }
}
