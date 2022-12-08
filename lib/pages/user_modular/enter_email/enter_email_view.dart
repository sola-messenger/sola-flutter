import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/input_column_field.dart';
import 'enter_email_controller.dart';

class EnterEmailPage extends GetView<EnterEmailController> {
  const EnterEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EnterEmailController(),
        id: 'enter email',
        builder: (ctl) {
          return Scaffold(
            body: _buildView(context, ctl),
          );
        });
  }

  Widget _buildView(BuildContext context, EnterEmailController ctl) {
    return ReactiveForm(
      formGroup: ctl.formGroup,
      child: ListView(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: Get.mediaQuery.padding.top+32,
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
                Center(
                  child: Text('Enter Your Email'.tr),
                ),
                const SizedBox(
                  height: 32,
                ),
                const InputColumnField(
                    title: 'Email',
                    formKey: 'email',
                    hint: 'Please set your Email'),
                const SizedBox(
                  height: 64,
                ),
                ElevatedButton(onPressed: ctl.onNext, child: Text('Next'.tr)),
              ],
            ),
    );
  }
}
