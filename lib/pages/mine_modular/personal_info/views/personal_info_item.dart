// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/r.dart';

class PersionalInfoItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onEdit;

  const PersionalInfoItem(
      {super.key, required this.title, required this.content, this.onEdit});

  @override
  Widget build(BuildContext context) {
    Widget rightWidget = Text(
      content,
      style: const TextStyle(
        color: Color(0xFF353434),
        fontSize: 12,
        height: 18 / 12,
      ),
    );
    if (onEdit != null) {
      rightWidget = GestureDetector(
        onTap: onEdit,
        child: Row(
          children: [
            rightWidget,
            const SizedBox(
              width: 4,
            ),
            Image.asset(
              R.assetsIconEditIcon,
              width: 18,
              height: 18,
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(

      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 10,
        bottom: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: AppTextStyles.black_bold_14,
          ),
          rightWidget,
        ],
      ),
    );
  }
}
