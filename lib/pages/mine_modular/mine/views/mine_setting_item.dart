// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';

class MineSettingItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final Widget? right;

  const MineSettingItem(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      this.right});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 20,
              height: 20,
              color: AppColors.mainBlueColor,
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
                child: Text(
              title.tr,
              style: const TextStyle(
                  fontSize: 14,
                  height: 21 / 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF111111)),
            )),
            if (right != null)
              Padding(
                padding: const EdgeInsets.only(
                    right: 13.0),
                child: DefaultTextStyle(
                    style: const TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 12,
                      height: 18 / 12,
                      fontWeight: FontWeight.w500,
                    ),
                    child: right!),
              ),
            Image.asset(
              R.assetsIconRightBlackIcon,
              width: 8,
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
