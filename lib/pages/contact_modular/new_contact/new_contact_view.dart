// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/pages/contact_modular/new_contact/views/new_contact_item.dart';
import 'package:sola/r.dart';
import 'new_contact_controller.dart';

class NewContactPage extends GetView<NewContactController> {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NewContactController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('New Contacts'.tr),
              actions: [
                TextButton(
                  onPressed: ctl.onAddContacts,
                  child: Image.asset(
                    R.assetsIconAddIcon,
                    width: 14,
                    height: 14,
                  ),
                ),
              ],
            ),
            body: SafeArea(child: _buildViews()),
          );
        });
  }

  Widget _buildViews() => ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 18,
        ),
        children: [
          NewContactItem(
              image: 'image',
              name: 'Jack Shen',
              desc: 'Apply to as your contact',
              status: 'Accept',
              onTap: () {
                Get.toNamed(Routers.contactInfoRoute);
              }),
          const NewContactItem(
              image: 'image',
              name: 'Jack Shen',
              desc: 'Apply to as your contact',
              status: 'Expired'),
        ],
      );
}
