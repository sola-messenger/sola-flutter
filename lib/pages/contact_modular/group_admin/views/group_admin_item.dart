// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';

class GroupAdminItem extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final String image;
  final String name;

  const GroupAdminItem({
    Key? key,
    required this.onTap,
    required this.onDelete,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              height: 22 / 14,
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: onDelete,
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: AppColors.mainDarkRedColor,
                  fontSize: 12,
                  height: 18 / 12,
                ),
              ))
        ],
      ),
    );
  }
}
