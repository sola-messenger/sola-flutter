import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/input_column_field.dart';
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
          body: ReactiveForm(
            formGroup: ctl.formGroup,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                const SizedBox(
                  height: 105,
                ),
                Text(
                  'Forget Password'.tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('You can reset your password by verify Email'.tr),
                const SizedBox(
                  height: 32,
                ),
                const InputColumnField(
                    title: 'Email/ Username',
                    hint: 'Enter your Login Email or User name',
                    formKey: 'userName',
                    keyboardType: TextInputType.emailAddress,),
                const SizedBox(
                  height: 16,
                ),
                ReactiveFormConsumer(builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return ElevatedButton(
                      onPressed: formGroup.valid ? ctl.onConfirm : null,
                      child: Text('Confirm'.tr));
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
