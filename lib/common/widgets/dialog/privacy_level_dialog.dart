// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';
import 'package:sola/r.dart';

class PrivacyLevelDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const PrivacyLevelDialog({Key? key, required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 61,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DialogHeaderWidget(
                title: 'Privacy Level ',
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 28.0,
                  right: 17,
                ),
                child: Text(
                  'Our message privacy level is divided into 2 levels:',
                  style: TextStyle(
                    color: AppColors.textBlackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 28.0,
                  right: 17,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      R.assetsIconCollectionIcon,
                      width: 10,
                      height: 10,
                      color: AppColors.mainBlueColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'High',
                      style: TextStyle(
                        color: AppColors.mainBlueColor,
                        fontSize: 10,
                        height: 16 / 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Our message privacy level is divided into 2 levels',
                style: TextStyle(
                  fontSize: 8,
                  height: 18 / 8,
                  color: AppColors.textBlackColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 28.0,
                  right: 17,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      R.assetsIconCommunicationBlueIcon,
                      width: 10,
                      height: 10,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'standard',
                      style: TextStyle(
                        color: AppColors.mainBlueColor,
                        fontSize: 10,
                        height: 16 / 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Our message privacy level is divided into 2 levels',
                style: TextStyle(
                  fontSize: 8,
                  height: 18 / 8,
                  color: AppColors.textBlackColor,
                ),
              ),
              const SizedBox(
                height: 59,
              ),
              FillButton(
                  buttonSizeEnum: ButtonSizeEnum.large,
                  onPressed: () {
                    Get.back();
                    onConfirm();
                  },
                  title: 'Confirm'),
              const SizedBox(
                height: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
