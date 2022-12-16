// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/white_color_button.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ConfirmDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onCancel,
      required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainBlueColor,
              borderRadius: BorderRadius.circular(7),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 31),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: title.isNotEmpty,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 18 / 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 52,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WhiteButton(
                        onPressed: () {
                          Get.back();
                          onCancel.call();
                        },
                        title: 'Cancel'.tr),
                    const SizedBox(
                      width: 12,
                    ),
                    WhiteButton(
                        isImport: true,
                        onPressed: () {
                          Get.back();
                          onConfirm.call();
                        },
                        title: 'Confirm'.tr),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
