// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/common/widgets/input/input_border_column_field.dart';
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
            body: SafeArea(child: _buildViews(ctl)),
          ),
        );
      },
    );
  }

  ListView _buildViews(ChangePasswordController ctl) {
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [
        const SizedBox(
          height: 14,
        ),
        Text(
          'Please set your new password and keep it safe'.tr,
          style: const TextStyle(
            fontSize: 10,
            height: 14 / 10,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const InputBorderColumnField(
          title: 'Original Password',
          formKey: 'ori_pwd',
          hint: 'Please enter your original password',
          obscureText: true,
        ),
        const SizedBox(
          height: 11,
        ),
        const InputBorderColumnField(
          title: 'New Password',
          formKey: 'pwd',
          hint: 'Please set your password',
          obscureText: true,
        ),
        Row(
          children: [
            Text(
              '● 8-16 characters'.tr,
              style: AppTextStyles.blue_10,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '● Capital letters and numbers'.tr,
              style: AppTextStyles.blue_10,
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        const InputBorderColumnField(
          title: 'Confirm Password',
          formKey: 'cpwd',
          hint: 'Please set your password',
          obscureText: true,
        ),
        Row(
          children: [
            Text(
              '● 8-16 characters'.tr,
              style: AppTextStyles.red_10,
            ),
          ],
        ),
        const SizedBox(
          height: 74,
        ),
        Center(
          child: FillButton(
            onPressed: ctl.onConfirm,
            title: 'Confirm',
          ),
        ),
      ],
    );
  }
}
