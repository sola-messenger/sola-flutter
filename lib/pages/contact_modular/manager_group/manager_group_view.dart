// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile2.dart';
import 'package:sola/common/widgets/list_tile/group_admin_list_tile.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'package:sola/common/widgets/sola_divider.dart';
import 'package:sola/r.dart';
import 'manager_group_controller.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: SolaDivider(),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: ctl.onSelectAvatar,
              child: Ink(
                width: 85,
                height: 80,
                decoration: BoxDecoration(border: RDottedLineBorder.all(
                  color: AppColors.mainBlueColor,
                )),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        R.assetsIconAddIcon,
                        width: 27,
                        height: 27,
                      ),
                    ),
                    Positioned(
                        right: 7,
                        bottom: 7,
                        child: Image.asset(
                          R.assetsIconCameraIcon,
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          ClickListTile2(
            onTap: () {},
            title: 'Chat name',
            content: 'Sola对接群',
            isShowLine: false,
          ),
          ClickListTile2(
            onTap: () {},
            title: 'Description(optional)',
            content: 'Sola对接专用',
            isShowLine: false,
          ),
          GroupAdminListTile(
              onTap: ctl.onNavGroupAdmin,
              title: 'Group Admin',
              avatars: const ['', '']),
          Obx(() => PrivacyLevelListTile(
                isPrivate: ctl.privacyLevel.value,
                onChangePrivate: ctl.onSelectPrivacyLevel,
              )),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => MyRadioListTile(
              title: 'Allow group members to invite',
              onTap: ctl.onChangeAllowInvite,
              isSelect: ctl.allowInvite.value,
            ),
          ),
          Obx(() => MyRadioListTile(
              title: 'Invitation Approval',
              isSelect: ctl.invitationApproval.value,
              onTap: ctl.onChangeInvitationApproval)),
          Obx(() => MyRadioListTile(
              title: 'Allow members to add friends',
              isSelect: ctl.allowAddFriend.value,
              onTap: ctl.onChangeAllowAddFriends)),
          const SizedBox(
            height: 123,
          ),
          Center(
            child: BorderButton(
              onPressed: ctl.onRemoveGroup,
              title: 'Remove the Group',
              textColor: AppColors.mainDarkRedColor,
            ),
          )
        ],
      );
}
