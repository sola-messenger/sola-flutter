import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/widgets/index.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context, RegisterController ctl) =>
      ReactiveForm(
        formGroup: ctl.formGroup,
        child: ListView(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: Get.mediaQuery.padding.top,
          ),
          children: [
            Center(
              child: Container(
                width: 40,
                height: 40,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(child: Text('Join Sola'.tr)),
            const SizedBox(
              height: 16,
            ),
            Center(child: Text('You can enter the invite code to join Sola')),
            _buildTip(),
            const InputColumnField(
                title: 'Invite Code',
                formKey: 'inviteCode',
                hint: 'Enter your invite code to join Sola'),
            _buildPrivacyCheck(ctl),
            const SizedBox(
              height: 8,
            ),
            ReactiveFormConsumer(builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ElevatedButton(
                  onPressed: formGroup.valid ? ctl.onRegister : null,
                  child: Text('Join Now'.tr));
            }),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: ctl.onNavLogin,
              child: Text('Already have account/Login'.tr),
            )
          ],
        ),
      );

  Container _buildTip() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.red,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to get invite code?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('-Create Organization:'),
            Text('Contact Us'),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '    Phone:',
                  style: TextStyle(
                    color: Colors.red,
                  )),
              TextSpan(
                  text: '+65 6571 0128',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                  )),
              TextSpan(
                  text: '(office hour)',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ])),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '    Email:',
                  style: TextStyle(
                    color: Colors.red,
                  )),
              TextSpan(
                  text: 'sola@xxx.com',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                  )),
            ])),
            SizedBox(
              height: 8,
            ),
            Text('-Join a Organization:'),
            Text('-Please contact your organization owener or\nadministrator'),
          ],
        ),
      ),
    );
  }

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
