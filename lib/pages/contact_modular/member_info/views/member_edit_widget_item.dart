import 'package:flutter/material.dart';
import 'package:sola/common/style/app_text_styles.dart';

class MemberEditWidgetItem extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onEdit;

  const MemberEditWidgetItem({
    Key? key,
    required this.title,
    required this.content,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFF3C3C43).withOpacity(0.29),
              width: 0.33,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.blue_14,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    content,
                    style: AppTextStyles.black_10,
                  ),
                ],
              ),
            ),
            const Text(
              'Edit',
              style: AppTextStyles.blue_10,
            ),
          ],
        ),
      ),
    );
  }
}
