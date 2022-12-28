// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/r.dart';

class GroupAdminListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final List<String> avatars;

  const GroupAdminListTile(
      {Key? key, this.onTap, required this.title, required this.avatars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.black_bold_14,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  math.min(avatars.length, 2),
                  (index) => Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                  ),
                ),
              ),
            )),
            const SizedBox(
              width: 5.5,
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                  )),
              margin: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                R.assetsIconAddIcon,
                width: 6,
                height: 6,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Total ${avatars.length}',
              style: const TextStyle(
                color: AppColors.mainBlueColor,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 17 / 14,
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
