// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

class ContactGroupItem extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? onTap;
  final String createdBy;

  const ContactGroupItem(
      {super.key,
      required this.title,
      required this.img,
      this.onTap,
      required this.createdBy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 6.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 22 / 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                  bottom: 16,
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
            Column(
              children: [
                Text(
                  'Create by'.tr,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0x66353434),
                  ),
                ),
                Text(
                  createdBy,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xCC353434),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
