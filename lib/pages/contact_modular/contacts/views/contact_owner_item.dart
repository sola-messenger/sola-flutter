// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

class ContactOwnerItem extends StatelessWidget {
  final String title;
  final String img;
  final String? content;
  final VoidCallback? onTap;

  const ContactOwnerItem(
      {super.key,
      required this.title,
      required this.img,
      this.content,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 17,
          left: 16,
          right: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 22 / 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (content != null)
                  Text(
                    content!,
                    style: const TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 13,
                      height: 18 / 13,
                    ),
                  ),
              ],
            )),
            Text(
              'Owner'.tr,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF848484),
              ),
            )
          ],
        ),
      ),
    );
  }
}
