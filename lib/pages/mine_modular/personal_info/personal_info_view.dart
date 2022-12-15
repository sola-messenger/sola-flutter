// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/pages/mine_modular/personal_info/views/personal_info_item.dart';
import 'personal_info_controller.dart';

class PersonalInfoPage extends GetView<PersonalInfoController> {
  const PersonalInfoPage({Key? key}) : super(key: key);

  Widget _buildView(PersonalInfoController ctl) => ListView(
        children: [
           const SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
              width: 60,
              height: 60,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          PersionalInfoItem(
              title: 'My Display Name',
              content: 'Eric Fang',
              onEdit: ctl.onEditDisplayName),
          const PersionalInfoItem(title: 'User Name', content: 'ericfang1'),
          const PersionalInfoItem(
              title: 'User ID', content: '@shenwei:sub1:thetranches.com'),
          PersionalInfoItem(
            title: 'Email',
            content: 'ericfang@gamil.com',
            onEdit: ctl.onEditEmail,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PersonalInfoController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Personal Info'.tr),
              
            ),
            body: _buildView(ctl),
          );
        });
  }
}
