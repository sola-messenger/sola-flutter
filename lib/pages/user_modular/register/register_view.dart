// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/ignore_box_decoration.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context, RegisterController ctl) =>
      ReactiveForm(
        formGroup: ctl.formGroup,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 23,
            right: 23,
          ),
          children: [
            Container(
              height: 264,
              decoration: const IgnoreBoxDecoration(
                color: AppColors.mainBlueColor,
                ignorePadding: EdgeInsets.only(
                  left: 23,
                  right: 23,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Welcome To SOLA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  height: 42 / 28,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'You can enter the invite code to join Sola',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 18 / 14,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const InputColumnField(
                title: 'Invite Code',
                formKey: 'inviteCode',
                hint: 'Enter your invite code to join Sola'),
            _buildPrivacyCheck(ctl),
            const SizedBox(
              height: 41,
            ),
            Center(
              child: ReactiveFormConsumer(builder:
                  (BuildContext context, FormGroup formGroup, Widget? child) {
                return FillButton(
                    buttonSizeEnum: ButtonSizeEnum.large,
                    onPressed: formGroup.valid ? ctl.onRegister : null,
                    title: 'Join Now'.tr);
              }),
            ),
            const SizedBox(
              height: 19,
            ),
            Center(
              child: BorderButton(
                  buttonSizeEnum: ButtonSizeEnum.large,
                  onPressed: ctl.onNavLogin,
                  title: '    Login    '.tr),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: GestureDetector(
                onTap: ctl.onNavLogin,
                child: Text(
                  'I have a account'.tr,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    height: 21 / 14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderButton(
                  title: 'Create Organization',
                  onPressed: ctl.onCreateOrg,
                  textFontSize: 10,
                ),
                const SizedBox(
                  width: 21,
                ),
                FillButton(
                  title: 'Join a Organization',
                  onPressed: ctl.onJoinOrganization,
                  textFontSize: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Center(
              child: GestureDetector(
                onTap: ctl.onShowService,
                child: const Text(
                  'How to get invite code?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    height: 18 / 12,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _buildPrivacyCheck(RegisterController ctl) => Row(
        children: [
          Obx(() => Checkbox(
              value: ctl.isAgreePrivacy.isTrue,
              onChanged: ctl.onChangePrivacyCheckBox)),
          Expanded(
              child: RichText(
            text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'I have read and agree with the',
                  ),
                  TextSpan(
                      text: ' Terms & Conditions ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = ctl.onNavTermsPage,
                      style: const TextStyle(
                        color: Colors.blue,
                      )),
                  const TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                      text: 'Privacy & Policy',
                      recognizer: TapGestureRecognizer()
                        ..onTap = ctl.onNavPrivacy,
                      style: const TextStyle(
                        color: Colors.blue,
                      )),
                ],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
          )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      id: 'register',
      builder: (RegisterController ctl) {
        return Scaffold(
          body: _buildView(context, ctl),
        );
      },
    );
  }
}
