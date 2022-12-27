import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/sola_check_box.dart';
import 'package:sola/common/widgets/sola_check_box2.dart';

class PrivacyCheckWidget extends StatelessWidget {
  final RxBool isAgree;
  final VoidCallback onChangePrivacyCheckBox;
  final VoidCallback onNavServiceAgreement;

  const PrivacyCheckWidget(
      {Key? key,
      required this.isAgree,
      required this.onChangePrivacyCheckBox,
      required this.onNavServiceAgreement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => SolaCheckBox(
            isSelect: isAgree.isTrue, onChange: onChangePrivacyCheckBox)),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: RichText(
          text: TextSpan(
              children: [
                const TextSpan(
                  text: 'I have read and agree with the',
                ),
                TextSpan(
                    text: ' Sola Service Agreement',
                    recognizer: TapGestureRecognizer()
                      ..onTap = onNavServiceAgreement,
                    style: const TextStyle(
                      color: AppColors.mainBlueColor,
                    )),
              ],
              style: const TextStyle(
                color: Color(0xFF636363),
                fontSize: 10,
              )),
        )),
      ],
    );
  }
}
