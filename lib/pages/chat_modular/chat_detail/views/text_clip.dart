// Flutter imports:
import 'package:flutter/material.dart';

import 'chat_message_item.dart';

class TextClip extends StatelessWidget {
  final String avatar;
  final String content;
  final bool isOwen;
  final VoidCallback onTapAvatar;

  const TextClip(
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
            bottomLeft: isOwen ? const Radius.circular(16) : const Radius.circular(0),
            bottomRight: isOwen ? const Radius.circular(0) : const Radius.circular(16),
          ),
        ),
        constraints: const BoxConstraints(
          maxWidth: 250,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Text(
          content,
          style: const TextStyle(
            color: Color(0xFF151515),
            fontSize: 16,
            height: 24 / 16,
          ),
        ),
      ),
      if(isOwen)
        MessageStateInherited.of(context).buildIcon(),
    ];

    if (isOwen) {
      // 右边
      children = children.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isOwen ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          MessageStateInherited.of(context).buildSelectIcon(),
          ...children,
        ],
      ),
    );
  }
}

