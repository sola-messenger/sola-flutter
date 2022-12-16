// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/pages/splash/views/splash_dot_widget.dart';
import 'package:sola/r.dart';
import 'splash_controller.dart';
import 'views/first_clip.dart';
import 'views/second_clip.dart';
import 'views/third_clip.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView(SplashController ctl) => ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: ctl.pageController,
              children: [
                _buildFirstPage(),
                _buildSecondPage(),
                _buildThirdPage(),
              ],
            ),
          ),
          SplashDotPageWidget(
            count: 3,
            controller: ctl.pageController,
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: FillButton(
                buttonSizeEnum: ButtonSizeEnum.large,
                onPressed: ctl.onCreateAccount,
                title: 'Create Account'.tr),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: BorderButton(
                buttonSizeEnum: ButtonSizeEnum.large,
                onPressed: ctl.onNavLogin,
                title: '         Login         '.tr),
          ),
          const SizedBox(
            height: 7,
          ),
          const Center(
            child: Text(
              'I have a account',
              style: TextStyle(fontSize: 14, color: Color(0x35343466)),
            ),
          ),
        ],
      );

  Widget _buildFirstPage() {
    return Column(
      children: [
        ClipPath(
          clipper: FirstClip(),
          child: Container(
            height: 350,
            color: AppColors.mainBlueColor,
            alignment: Alignment.center,
            child: Image.asset(
              R.assetsIconSplashIcon1,
              width: 143,
              height: 143,
            ),
          ),
        ),
        const Text(
          'Own Your Conversation',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            height: 30 / 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            'Secure and independent communication, providing you with the same level of privacy when facing face-to-face conversations at home.',
            style: TextStyle(
              fontSize: 14,
              height: 21 / 14,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildThirdPage() {
    return Column(
      children: [
        ClipPath(
          clipper: ThirdClip(),
          child: Container(
            height: 350,
            color: AppColors.mainBlueColor,
            alignment: Alignment.center,
            child: Image.asset(
              R.assetsIconSplashIcon3,
              width: 143,
              height: 143,
            ),
          ),
        ),
        const Text(
          'Secure Messaging',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            height: 30 / 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            'End to end encryption, no phone number required. No advertising and data mining.',
            style: TextStyle(
              fontSize: 14,
              height: 21 / 14,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSecondPage() {
    return Column(
      children: [
        ClipPath(
          clipper: SecondClip(),
          child: Container(
            height: 350,
            color: AppColors.mainBlueColor,
            alignment: Alignment.center,
            child: Image.asset(
              R.assetsIconSplashIcon2,
              width: 143,
              height: 143,
            ),
          ),
        ),
        const Text(
          'You Control Everything',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            height: 30 / 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Text(
            'Choose to save your dialogue location, giving you control and independence.',
            style: TextStyle(
              fontSize: 14,
              height: 21 / 14,
            ),
          ),
        )
      ],
    );
  }

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
