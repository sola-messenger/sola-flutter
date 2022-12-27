// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';

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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: const Border(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogHeaderWidget(title: 'New Version'.tr),
              const SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0,right: 20),
                    child: Text(
                      'APP version:$versionName',
                      style: const TextStyle(
                        color: Colors.black,
                        height: 21 / 14,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0,right: 20),
                child: Text(
                  updateInfo,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 81,
              ),
              if (isForce)
                FillButton(onPressed: onUpgrade, title: 'Update'.tr)
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                ),
              const SizedBox(
                height: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
