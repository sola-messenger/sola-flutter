// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/r.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (ctl) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: ReactiveForm(
          formGroup: ctl.form,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 20,
              left: 16,
              right: 16,
            ),
            children: [
               InputColumnField(
                title: 'Organization Name',
                hint: 'Please enter your organization name',
                formKey: 'orgName',
                icon: Image.asset(R.assetsIconOrgNameIcon),
              ),
               InputColumnField(
                title: 'Email/ Username',
                hint: 'Please enter your email or User name',
                formKey: 'userName',
                icon: Image.asset(R.assetsIconUsernameIcon),
              ),
               InputColumnField(
                title: 'Password',
                hint: 'Please enter password',
                formKey: 'password',
                obscureText: true,
                icon: Image.asset(R.assetsIconPasswordIcon),
              ),
              const SizedBox(
                height: 40,
              ),
              ReactiveFormConsumer(
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return Center(
                    child: FillButton(
                      buttonSizeEnum: ButtonSizeEnum.large,
                      onPressed: formGroup.valid ? ctl.onLogin : null,
                      title: '  Login  '.tr,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 13,
              ),
              Center(
                child: GestureDetector(
                  onTap: ctl.onForgotPassword,
                  child: Text(
                    'Forgot Password'.tr,
                    style: const TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              const Center(
                child: Text(
                  'No account?',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Center(
                child: BorderButton(
                  buttonSizeEnum: ButtonSizeEnum.large,
                  onPressed: ctl.onRegister,
                  title: 'Register'.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
