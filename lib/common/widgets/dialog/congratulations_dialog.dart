import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

import '../button/fill_button.dart';
import 'dialog_header_widget.dart';

class CongratulationsDialog extends StatelessWidget {
  final VoidCallback onContinue;

  const CongratulationsDialog({Key? key, required this.onContinue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.bgWhiteColor,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(2, 5),
                    blurRadius: 2,
                  ),
                ]),
            margin: const EdgeInsets.symmetric(
              horizontal: 45,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DialogHeaderWidget(),
                const SizedBox(
                  height: 9,
                ),
                const Center(
                  child: Text(
                    'Congratulations!',
                    style: TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 20,
                      height: 30 / 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 15),
                  child: Text(
                    'You have successfully joined the Matrix Organization  ',
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 12,
                      height: 18 / 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 103,
                ),
                Center(
                  child: FillButton(
                      onPressed: () {
                        Get.back();
                        onContinue.call();
                      },
                      title: 'Continue'.tr),
                ),
                const SizedBox(
                  height: 29,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
