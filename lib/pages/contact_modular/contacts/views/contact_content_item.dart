// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';

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
              width: 44,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    height: 22 / 14,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  content,
                  style: const TextStyle(
                    color: AppColors.mainBlueColor,
                    fontSize: 13,
                    height: 18 / 13,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
