// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
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

  Widget _buildView() => ListView(
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
  );
}
