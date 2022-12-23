// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/common/widgets/input/input_border_column_field.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ForgotPasswordController(),
      id: 'forgot Psw',
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Forgot Password'.tr),
          ),
          body: ReactiveForm(
            formGroup: ctl.formGroup,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Forget Password'.tr,
                  style: const TextStyle(
                    color: AppColors.mainBlueColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'You can reset your password by verify Email'.tr,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                const InputBorderColumnField(
                  title: 'Email/ Username',
                  hint: 'Enter your Login Email or User name',
                  formKey: 'userName',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 108,
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
