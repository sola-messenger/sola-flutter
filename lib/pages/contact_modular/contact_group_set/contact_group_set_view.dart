// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/common/widgets/sola_divider.dart';
import 'package:sola/pages/contact_modular/contact_group_set/views/member_list_wrap.dart';
import 'package:sola/r.dart';
import 'contact_group_set_controller.dart';

class ContactGroupSetPage extends GetView<ContactGroupSetController> {
  const ContactGroupSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactGroupSetController(),
        id: 'contact group set',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: StreamBuilder(
                stream: ctl.room.value?.onUpdate.stream,
                builder: (context, _) {
                  return Text(
                      '${ctl.room.value!.displayname}(${ctl.room.value!.getParticipants().length})');
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    R.assetsIconMuteIcon,
                    width: 14,
                    height: 14,
                  ),
                ),
              ],
            ),
            body: StreamBuilder(
              stream: ctl.room.value?.onUpdate.stream,
              builder: (context, _) {
                return _buildView(ctl);
              },
            ),
          );
        });
  }

  Widget _buildView(ContactGroupSetController ctl) => ListView(
        children: [
          const SizedBox(
            height: 19,
          ),
          Obx(() => MemberListWrap(
              members: ctl.members.value,
              onMemberDetail: ctl.onNavMemberInfo,
              onAdd: ctl.onAddMember,
              onRemove: ctl.onRemoveMember)),
          const SizedBox(
            height: 19,
          ),
          Center(
            child: InkWell(
              onTap: ctl.onViewMoreMembers,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'View more members',
                    style: AppTextStyles.grey_14,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Image.asset(
                      R.assetsIconRightBlackIcon,
                      width: 12,
                      height: 8,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const SolaDivider(),
          ClickListTile(
            title: 'Chat Name',
            content: ctl.room.value!.displayname,
            isShowLine: false,
          ),
          ClickListTile(
            onTap: ctl.onChangeDescription,
            title: 'Description',
            content: ctl.room.value!.topic,
            isShowLine: false,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Group QR Code',
            isShowLine: false,
          ),
           ClickListTile(
            title: 'Remark',
            content: ctl.room.value!.topic,
            isShowLine: false,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Search Chat history',
            isShowLine: false,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Clear my History',
            isShowLine: false,
          ),
          MyRadioListTile(
            onTap: () {},
            title: 'Sticky on Top',
            isSelect: true,
          ),
          const ClickListTile(
            title: 'My Alias in Group',
            content: 'Eric Fang',
            isShowLine: false,
          ),
          ClickListTile(
            onTap: ctl.onNavManageGroup,
            title: 'Manage Group',
            isShowLine: false,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: BorderButton(
              buttonSizeEnum: ButtonSizeEnum.large,
              onPressed: ctl.onLeaveGroup,
              title: 'Leave Group',
              textColor: AppColors.mainDarkRedColor,
            ),
          ),
        ],
      );
}
