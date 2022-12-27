import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/input/privacy_check_widget.dart';
import 'org_set_info_controller.dart';

class OrgSetInfoPage extends GetView<OrgSetInfoController> {
  const OrgSetInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrgSetInfoController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Set Organization Info'),
            ),
            body: SafeArea(child: _buildViews(ctl)),
          );
        });
  }

  Widget _buildViews(OrgSetInfoController ctl) => ReactiveForm(
        formGroup: ctl.formGroup,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          children: [
            const InputColumnField(
              title: 'Organization Name',
              formKey: 'orgName',
              hint: 'Please set your user name',
              textColor: Colors.black,
            ),
            Obx(() => RadioColumnField(
                  title: 'Allow Organization member to communicate',
                  selectList: const ['Allow', 'Forbid'],
                  selected: ctl.allowMembers.value,
                  onSelect: ctl.onSelectAllowMembers,
                )),
            const SizedBox(
              height: 24,
            ),
            const MoreInputColumnField(
                title: 'Description',
                formKey: 'desc',
                hint: 'Please enter description of your  organization'),
            const SizedBox(
              height: 22,
            ),
            PrivacyCheckWidget(
                isAgree: ctl.isAgree,
                onChangePrivacyCheckBox: ctl.onChangePrivacyCheckBox,
                onNavServiceAgreement: ctl.onNavServiceAgreement),
            const SizedBox(
              height: 46,
            ),
            Center(
              child: FillButton(
                title: 'Confirm',
                onPressed: ctl.onConfirm,
              ),
            )
          ],
        ),
      );
}
