// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_text_styles.dart';

class ClickListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? content;

  const ClickListTile({Key? key, this.onTap, required this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.only(
          left: 13,
          right: 13,
          bottom: 9,
          top: 20
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFCDD1D0),
              width: 1,
            )
          )
        ),
        child: Row(
          children: [
            Text(
              title,
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (onTap != null) const Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}
