// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/header/personal_info_header.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'contact_info_controller.dart';

class ContactInfoPage extends GetView<ContactInfoController> {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactInfoController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Personal Info'),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(ContactInfoController ctl) => ListView(
        children: [
          const PersonalInfoHeader(
            image: '',
            name: 'Jack Shen',
            desc: '@shenwei:sub1:thetranches.com',
          ),
          Container(
            height: 4,
            color: Colors.grey.withOpacity(0.5),
          ),
          const ClickListTile(
            title: 'Organization',
            content: 'DCC DEV',
          ),
          FormGroupWidget(addDivider: false, children: [
            const SizedBox(
              height: 16,
            ),
            PrivacyLevelListTile(isPrivate: false, onChangePrivate: (value) {}),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: ctl.onAddAsContact,
                  child: Text('Add as Contact'.tr)),
            ),
            const SizedBox(
              height: 32,
            ),
          ]),
        ],
      );
}
