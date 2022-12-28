// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';

class ClickListTile2 extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? content;
  final bool isShowLine;

  const ClickListTile2(
      {Key? key,
      this.onTap,
      required this.title,
      this.content,
      this.isShowLine = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.only(
            left: 13,
            right: 13,
            bottom: isShowLine ? 9 : 8,
            top: isShowLine ? 20 : 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: isShowLine
                    ? const BorderSide(
                        color: Color(0xFFCDD1D0),
                        width: 1,
                      )
                    : BorderSide.none)),
        child: Row(
          children: [
            Text(
              title.tr,
              style: AppTextStyles.black_bold_14,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  content ?? '',
                  style: const TextStyle(
                    color: AppColors.mainBlueColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            if (onTap != null)
              const Icon(
                Icons.chevron_right_sharp,
                color: AppColors.mainBlueColor,
              ),
          ],
        ),
      ),
    );
  }
}
