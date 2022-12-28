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
              title: const Text('Group(91)'),
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
            body: _buildView(ctl),
          );
        });
  }

  Widget _buildView(ContactGroupSetController ctl) => ListView(
        children: [
          const SizedBox(
            height: 19,
          ),
          MemberListWrap(
              members: List.generate(10, (index) => ''),
              onMemberDetail: ctl.onNavMemberInfo,
              onAdd: ctl.onAddMember,
              onRemove: ctl.onRemoveMember),
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
          const ClickListTile(
            title: 'Chat Name',
            content: 'Sola',
            isShowLine: false,
          ),
          const ClickListTile(
            title: 'Description',
            content: 'Sola对接专用',
            isShowLine: false,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Group QR Code',
            isShowLine: false,
          ),
          const ClickListTile(
            title: 'Remark',
            content: 'sjsjsjsj',
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
