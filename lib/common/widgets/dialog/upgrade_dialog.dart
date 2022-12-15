// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

class UpgradeDialog extends StatelessWidget {
  final VoidCallback onUpgrade;
  final String versionName;
  final String updateInfo;
  final bool isForce;

  const UpgradeDialog(
      {super.key,
      required this.onUpgrade,
      required this.versionName,
      required this.updateInfo,
      this.isForce = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 49,
            left: 28,
            right: 28,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: const Border(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'S-C',
                  style: TextStyle(
                    color: AppColors.mainBlueColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'New Version'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'APP version:$versionName',
                    style: const TextStyle(
                      color: Colors.black,
                      height: 21 / 14,
                      fontSize: 14,
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                updateInfo,
                style: const TextStyle(
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
              const SizedBox(
                height: 81,
              ),
              if (isForce)
                FillButton(onPressed: onUpgrade, title: 'Update'.tr)
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderButton(
                      title: 'Cancel',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    FillButton(onPressed: onUpgrade, title: 'Update'.tr)
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
