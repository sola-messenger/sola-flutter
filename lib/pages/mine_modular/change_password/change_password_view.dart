import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/widgets/index.dart';
import 'change_password_controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChangePasswordController(),
      id: 'reset Psw',
      builder: (ctl) {
        return ReactiveForm(
          formGroup: ctl.formGroup,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Change Password'.tr),
            ),
            body: ListView(
              padding: const EdgeInsets.only(left: 16, right: 16),
              children: [
                SizedBox(
                  height: 32,
                ),
                Center(
                  child:
                      Text('Please set your new password and keep it safe'.tr),
                ),
                SizedBox(
                  height: 32,
                ),
                InputColumnField(
                  title: 'Password',
                  formKey: 'pwd',
                  hint: 'Please set your password',
                  obscureText: true,
                ),
                Row(
                  children: [
                    Text('8-16 characters'),
                    SizedBox(
                      width: 16,
                    ),
                    Text('letters and numbers'),
                  ],
                ),
                InputColumnField(
                  title: 'Confirm Password',
                  formKey: 'cpwd',
                  hint: 'Please enter your password again',
                  obscureText: true,
                ),
                Row(
                  children: [
                    Text('8-16 characters'),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: ctl.onConfirm, child: Text('Confirm')),
              ],
            ),
          ),
        );
      },
    );
  }
}
