// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/pages/contact_modular/new_contact/views/new_contact_item.dart';
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
                    child: const Text(
                      'Add Contacts',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            body: SafeArea(child: _buildViews()),
          );
        });
  }

  Widget _buildViews() => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: [
            NewContactItem(
                image: 'image',
                name: 'Jack Shen',
                desc: 'Apply to as your contact',
                status: 'Accept',
                onTap: () {
                  Get.toNamed(Routers.contactInfoRoute);
                }),
          ],
        ),
      );
}
