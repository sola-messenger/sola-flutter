


// Flutter imports:
import 'package:flutter/material.dart';

class TextClip extends StatelessWidget {
  final String avatar;
  final String content;
  final bool isOwen;
  final VoidCallback onTapAvatar;
  const TextClip({super.key, required this.avatar, required this.content, required this.isOwen, required this.onTapAvatar});

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
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8)
          ),
        ),
      ),
      const SizedBox(
        width: 6,
      ),
      Container(
        decoration: BoxDecoration(
          color: isOwen?Colors.blue: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: const BoxConstraints(
          maxWidth: 250,
        ),
        padding: const EdgeInsets.only(
          left: 4,
          right: 4,
          top: 10,
          bottom: 10,
        ),
        child: Text(content,style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),),
      )
    ];

    if(isOwen){
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
        mainAxisAlignment: isOwen?MainAxisAlignment.end: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
