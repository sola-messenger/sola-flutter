import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/input_column_field.dart';
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
            Center(child: Text('Create Account'.tr)),
            const SizedBox(
              height: 16,
            ),
            const InputColumnField(
                title: 'Username',
                formKey: 'userName',
                hint: 'Please set your username'),
            const InputColumnField(
                title: 'Password',
                formKey: 'password',
                hint: 'Set your password',
                obscureText: true,),
            const InputColumnField(
                title: 'Invite Code',
                formKey: 'inviteCode',
                hint: 'Enter your invite code to regist'),
            _buildPrivacyCheck(ctl),
            const SizedBox(
              height: 8,
            ),
            ReactiveFormConsumer(builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ElevatedButton(
                  onPressed: formGroup.valid?ctl.onRegister:null, child: Text('Register'.tr));
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
