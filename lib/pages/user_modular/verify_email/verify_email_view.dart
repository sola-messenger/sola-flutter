import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/pages/user_modular/verify_email/verify_email_controller.dart';

class VerifyEmailPage extends GetView<VerifyEmailController> {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyEmailController>(
      init: VerifyEmailController(),
      id: "verify email",
      builder: (ctl) => Scaffold(
        body: ListView(
          padding: EdgeInsets.only(
            top: Get.mediaQuery.padding.top,
            left: 16,
            right: 16,
          ),
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Container(
                width: 40,
                height: 40,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(child: Text('Verify Your Email')),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text('Follow the instruction of Email to\n ercfang@gmail.com',
            textAlign: TextAlign.center,)),
            const SizedBox(
              height: 120,
            ),
            const Center(child: Text('No Email received?')),
            Center(
              child: TextButton(
                  onPressed: ctl.onResend,
                  child: Text('Resent Email'.tr)),
            ),
          ],
        ),
      ),
    );
  }

}
