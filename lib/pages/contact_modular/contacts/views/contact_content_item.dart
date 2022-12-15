// Flutter imports:
import 'package:flutter/material.dart';

class ContactContentItem extends StatelessWidget {
  final String title;
  final String img;
  final String content;
  final VoidCallback? onTap;

  const ContactContentItem(
      {super.key,
      required this.title,
      required this.img,
      required this.content,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  content,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
