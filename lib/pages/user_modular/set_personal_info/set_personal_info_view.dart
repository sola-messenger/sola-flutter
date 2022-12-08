import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/input_column_field.dart';
import 'set_personal_info_controller.dart';

class SetPersonalInfoPage extends GetView<SetPersonalInfoController> {
  const SetPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SetPersonalInfoController(),
      id: 'set personal info',
      builder: (ctl) {
        return Scaffold(
          body: _buildView(ctl),
        );
      },
    );
  }

  Widget _buildView(SetPersonalInfoController ctl) {
    return ReactiveForm(
      formGroup: ctl.fromGroup,
      child: ListView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: Get.mediaQuery.padding.top + 120,
        ),
        children: [
          Center(child: Text('Set your avatar'.tr)),
          const SizedBox(
            height: 16,
          ),
          const Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Placeholder(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(child: Text('Set your display name'.tr)),
          const SizedBox(
            height: 16,
          ),
          const InputColumnField(
              title: 'Display Name',
              formKey: 'displayName',
              hint: 'Please set your display name'),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: ctl.onSaveAndContinue,
              child: Text('Save and Continue'.tr)),
          const SizedBox(
            height: 16,
          ),
          TextButton(onPressed: ctl.onSkip, child: Text('Skip This Step'.tr)),
        ],
      ),
    );
  }
}
