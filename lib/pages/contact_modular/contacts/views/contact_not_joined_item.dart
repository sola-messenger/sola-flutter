// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

class ContactNotJoinedItem extends StatelessWidget {
  final String inviteCode;
  final VoidCallback? onCopy;

  const ContactNotJoinedItem({
    super.key,
    required this.inviteCode,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 9,
      ),
      child: Row(
        children: [
          const Text(
            'Not joined',
            style: TextStyle(
              color: AppColors.textBlackColor,
              fontSize: 12,
              height: 18 / 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 86,
          ),
          Text(
            inviteCode,
            style: const TextStyle(color: Colors.black),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onCopy,
            child: const Text(
              'Copy',
              style: TextStyle(
                fontSize: 10,
                height: 18 / 10,
                fontWeight: FontWeight.w500,
                color: AppColors.mainBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
