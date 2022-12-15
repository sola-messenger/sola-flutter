// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/widgets/input_column_field.dart';
import 'set_login_info_controller.dart';

class SetLoginInfoPage extends GetView<SetLoginInfoController> {
  const SetLoginInfoPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context, SetLoginInfoController ctl) =>
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
            Text('Join Organization'.tr),
            Text('XXXXs Organization'.tr),
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
            ),
            const SizedBox(
              height: 8,
            ),
            ReactiveFormConsumer(builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ElevatedButton(
                  onPressed: formGroup.valid ? ctl.onConfirm : null,
                  child: Text('Confirm'.tr));
            }),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SetLoginInfoController(),
        id: 'set login info',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Set Login Info'.tr),
            ),
            body: SafeArea(child: _buildView(context, ctl)),
          );
        });
  }
}
