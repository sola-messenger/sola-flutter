import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/widgets/index.dart';
import 'org_create_controller.dart';

class OrgCreatePage extends GetView<OrgCreateController> {
    const OrgCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrgCreateController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Create Organization'.tr),
            ),
            body: SafeArea(child: _buildView(context, ctl)),
          );
        });
  }

  Widget _buildView(BuildContext context, OrgCreateController ctl) =>
      ReactiveForm(
        formGroup: ctl.formGroup,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 8,
            right: 12,
          ),
          children: [
            const SizedBox(
              height: 12,
            ),
            const Center(child:  Text('Please set your organization\'s info',style: TextStyle(
              fontWeight: FontWeight.bold,
            ),)),
            const SizedBox(
              height: 64,
            ),
            const InputColumnField(
                title: 'Organization Name',
                formKey: 'orgName',
                hint: 'Please set your Organization Name'),
            Obx(() => RadioColumnField(
                  title: 'Allow Organization member to communicate',
                  selectList: const ['Alloq', 'Forbid'],
                  selected: ctl.allowItem.value,
                  onSelect: ctl.onSelectAllow,
                )),
            const MoreInputColumnField(
                title: 'Description',
                formKey: 'desc',
                hint: 'Please enter description of your  organization'),
            Obx(
              () => PriceRadioColumnField(
                  title: 'Number of Organization Members',
                  onSelect: ctl.onSelectPrice,
                  selected: ctl.priceData.value,
                  memberList: [
                    OrganizationMembers(1, 15, '15', null),
                    OrganizationMembers(2, 30, '28', null),
                    OrganizationMembers(3, 50, '40', null),
                    OrganizationMembers(4, 100, '100', '75'),
                  ]),
            ),
            Obx(
              () => PreodRadioColumnField(
                  title: 'Use Perod',
                  onSelect: ctl.onSelectPreod,
                  selected: ctl.preodData.value,
                  perodList: const [
                    3,
                    6,
                    9,
                    12,
                    18,
                    24,
                    36,
                    48,
                  ]),
            ),
            const Divider(),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total Amount'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '\$ 45.00',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildPrivacyCheck(ctl),
             const SizedBox(
              height: 16,
            ),
            ElevatedButton(onPressed: ctl.onConfirm, child: const Text('Confirm')),
          ],
        ),
      );

  Widget _buildPrivacyCheck(OrgCreateController ctl) => Row(
        children: [
          Obx(() => Checkbox(
              value: ctl.isAgree.isTrue,
              onChanged: ctl.onChangePrivacyCheckBox)),
          Expanded(
              child: RichText(
            text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'I have read and agree with the',
                  ),
                  TextSpan(
                      text: ' Sola Service Agreement',
                      recognizer: TapGestureRecognizer()
                        ..onTap = ctl.onNavServiceAgreement,
                      style: const TextStyle(
                        color: Colors.blue,
                      )),
                ],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
          )),
        ],
      );
}
