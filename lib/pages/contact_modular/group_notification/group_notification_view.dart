import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';
import 'package:sola/pages/contact_modular/new_contact/views/new_contact_item.dart';
import 'group_notification_controller.dart';

class GroupNotificationPage extends GetView<GroupNotificationController> {
  const GroupNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GroupNotificationController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Group notification'.tr),
            ),
            body: _buildView(),
          );
        });
  }

  Widget _buildView() => Container(
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
                desc: 'Apply to join the \'Work Discussion\'',
                status: 'Accept',
                onTap: () {
                  Get.toNamed(Routers.contactInfoRoute);
                }),
          ],
        ),
      );
}
