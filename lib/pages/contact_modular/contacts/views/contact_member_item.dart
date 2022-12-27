// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

class ContactMemberItem extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  const ContactMemberItem({
    super.key,
    required this.title,
    required this.img,
    this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 16,
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
              width: 6,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                ),
                child: Text(
                  'Remove',
                  style: TextStyle(
                    color: AppColors.mainDarkRedColor,
                    fontSize: 12,
                    height: 18 / 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Reset'.tr,
                style: const TextStyle(
                  color: Color(0x66353434),
                  fontSize: 11,
                  height: 18 / 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
