import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/splash/views/splash_dot_widget.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView(SplashController ctl) => ListView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: Get.mediaQuery.padding.top,
        ),
        shrinkWrap: true,
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          const Center(
            child: Text(
              'Own your conversation',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: Text(
              'Secure and independent communication, providing you with the same level of privacy when facing face-to-face conversations at home',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          const SplashDotWidget(count: 3, index: 1),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: ctl.onCreateAccount, child: Text('Create Account'.tr)),
          const SizedBox(
            height: 16,
          ),
          TextButton(
            onPressed: ctl.onNavLogin,
            child: Text('I have account, Login'.tr),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (ctl) {
          return Scaffold(
            body: Center(child: _buildView(ctl)),
          );
        });
  }
}
