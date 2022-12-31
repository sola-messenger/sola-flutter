// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';

class ClickListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? content;
  final bool isShowLine;
  final TextStyle? contentStyle;
  final Widget? contentWidget;

  const ClickListTile(
      {Key? key,
      this.onTap,
      required this.title,
      this.content,
      this.isShowLine = true,
      this.contentStyle,
      this.contentWidget})
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
                child: contentWidget ??
                    Text(
                      content ?? '',
                      style: contentStyle ??
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 22 / 14,
                          ),
                    ),
              ),
            ),
            if (onTap != null && contentWidget == null)
              const Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}
