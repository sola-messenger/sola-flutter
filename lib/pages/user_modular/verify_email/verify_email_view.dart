// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';

// Project imports:
import 'package:sola/pages/user_modular/verify_email/verify_email_controller.dart';
import 'package:sola/r.dart';

class VerifyEmailPage extends GetView<VerifyEmailController> {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyEmailController>(
      init: VerifyEmailController(),
      id: "verify email",
      builder: (ctl) => Scaffold(
        body: GestureDetector(
          onTap: (){
            ctl.onShowSuccessDialog();
          },
          child: ListView(
            padding: EdgeInsets.only(
              top: Get.mediaQuery.padding.top,
              left: 16,
              right: 16,
            ),
            children: [
              const SizedBox(
                height: 72,
              ),
              Center(
                child: SizedBox(
                  width: 65,
                  height: 70,
                  child: Image.asset(R.assetsIconEmailIcon),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                  child: Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.mainBlueColor,
                  height: 24 / 16,
                ),
              )),
              const SizedBox(
                height: 31,
              ),
              const Center(
                  child: Text(
                'Follow the instruction of Email to\n ercfang@gmail.com',
                style: TextStyle(
                  color: AppColors.textBlackColor,
                  fontSize: 16,
                  height: 21 / 16,
                ),
              )),
              const SizedBox(
                height: 191,
              ),
              const Center(
                  child: Text(
                'No Email received?',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textBlackColor,
                  height: 21 / 14,
                ),
              )),
              Center(
                child: TextButton(
                    onPressed: ctl.onResend, child: Text('Resent Email'.tr)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
