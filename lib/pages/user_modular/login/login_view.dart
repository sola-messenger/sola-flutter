// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (ctl) => Scaffold(
        body: ReactiveForm(
          formGroup: ctl.form,
          child: ListView(
            padding: EdgeInsets.only(
              top: Get.mediaQuery.padding.top,
              left: 16,
              right: 16,
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
                height: 8,
              ),
              const Center(child: Text('Login')),
              const SizedBox(
                height: 30,
              ),
              const InputColumnField(
                title: 'Organization Name',
                hint: 'Please enter your organization name',
                formKey: 'orgName',
              ),
              const InputColumnField(
                title: 'Email/ Username',
                hint: 'Please enter your email or User name',
                formKey: 'userName',
              ),
              const InputColumnField(
                title: 'Password',
                hint: 'Please enter password',
                formKey: 'password',
              ),
              const SizedBox(
                height: 40,
              ),
              ReactiveFormConsumer(
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return ElevatedButton(
                    onPressed: formGroup.valid? ctl.onLogin:null,
                    child: Text('Login'.tr),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: ctl.onForgotPassword,
                    child: Text('Forgot Password?'.tr),
                  )),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                    onPressed: ctl.onRegister,
                    child: Text('No account? / Register'.tr)),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
