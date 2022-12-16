// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/input_column_field.dart';
import 'set_login_info_controller.dart';

class SetLoginInfoPage extends GetView<SetLoginInfoController> {
  const SetLoginInfoPage({Key? key}) : super(key: key);

  Widget _buildView(BuildContext context, SetLoginInfoController ctl) =>
      ReactiveForm(
        formGroup: ctl.formGroup,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          children: [
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              'Join Organization'.tr,
              style: const TextStyle(
                color: AppColors.mainBlueColor,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text('XXXXs Organization'.tr),
            const SizedBox(
              height: 16,
            ),
            const InputColumnField(
                title: 'Email / Username',
                formKey: 'userName',
                hint: 'Please set your username'),
            const InputColumnField(
              title: 'Password',
              formKey: 'password',
              hint: 'Set your password',
            ),
            const SizedBox(
              height: 111,
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
