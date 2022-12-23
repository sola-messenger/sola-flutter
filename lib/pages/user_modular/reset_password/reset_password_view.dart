// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/common/widgets/input/input_border_column_field.dart';
import 'reset_password_controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ResetPasswordController(),
      id: 'reset Psw',
      builder: (ctl) {
        return ReactiveForm(
          formGroup: ctl.formGroup,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Reset Password'.tr),
            ),
            body: ListView(
              padding: const EdgeInsets.only(left: 12, right: 16),
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Please set your new password and keep it safe'.tr,
                  style: AppTextStyles.grey_10,
                ),
                const SizedBox(
                  height: 17,
                ),
                const InputBorderColumnField(
                  title: 'New Password',
                  formKey: 'pwd',
                  hint: 'Please set your password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 14,
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
                      '● letters and numbers'.tr,
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
                  hint: 'Please enter your password again',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 13,
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
                ReactiveFormConsumer(builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return Center(
                    child: FillButton(
                        buttonSizeEnum: ButtonSizeEnum.large,
                        onPressed: formGroup.valid ? ctl.onConfirm : null,
                        title: 'Confirm'.tr),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
