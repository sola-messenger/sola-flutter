import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/group_admin_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'manager_group_controller.dart';

class ManagerGroupPage extends GetView<ManagerGroupController> {
  const ManagerGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ManagerGroupController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Manage Group'),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(ManagerGroupController ctl) => ListView(
        children: [
          Container(
            height: 5,
            color: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(
              top: 6,
              bottom: 16,
            ),
          ),
          Center(
            child: Container(
              width: 50,
              height: 40,
              color: Colors.grey,
            ),
          ),
          ClickListTile(
            onTap: () {},
            title: 'Chat name',
            content: 'Sola对接群',
          ),
          ClickListTile(
            onTap: () {},
            title: 'Description',
            content: 'Sola对接专用',
          ),
          GroupAdminListTile(
              onTap: ctl.onNavGroupAdmin,
              title: 'Group Admin',
              avatars: const ['', '']),
          Obx(() => PrivacyLevelListTile(
                isPrivate: ctl.privacyLevel.value,
                onChangePrivate: ctl.onSelectPrivacyLevel,
              )),
          Obx(
            () => CheckboxListTile(
                title: Text('Allow group members to invite'.tr),
                value: ctl.allowInvite.value,
                onChanged: ctl.onChangeAllowInvite),
          ),
          Obx(() => CheckboxListTile(
              title: Text('Invitation Approval'.tr),
              value: ctl.invitationApproval.value,
              onChanged: ctl.onChangeInvitationApproval)),
          Obx(() => CheckboxListTile(
              title: Text('Allow members to add friends'.tr),
              value: ctl.allowAddFriend.value,
              onChanged: ctl.onChangeAllowAddFriends)),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: ctl.onRemoveGroup,
              child: const Text('Remove the Group'))
        ],
      );
}
