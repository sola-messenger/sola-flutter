// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'member_info_controller.dart';
import 'views/border_click_list_tile.dart';
import 'views/member_edit_widget_item.dart';

class MemberInfoPage extends GetView<MemberInfoController> {
  const MemberInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MemberInfoController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Personal Info'.tr),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(MemberInfoController ctl) => ListView(
        children: [
          _buildHeader(),
          Container(
            height: 0.33,
            color: const Color(0xFF3C3C43).withOpacity(0.29),
          ),
          MemberEditWidgetItem(
            title: 'Organization',
            content: 'DCC DEV',
            onEdit: () {},
          ),
          MemberEditWidgetItem(
            title: 'Nickname',
            content: '申威',
            onEdit: () {},
          ),
          MemberEditWidgetItem(
            title: 'Description',
            content: 'shhhdhhhdhh  ddjdjjdjdjjdjjdhdhdhdddd',
            onEdit: () {},
          ),
          // if (ctl.formType == ComeFormType.contact)
          //   PrivacyLevelListTile(isPrivate: false, onChangePrivate: (value) {}),
          const SizedBox(
            height: 20,
          ),
          BorderClickListTile(
            title: 'Share to friends',
            onTap: () {},
          ),
          const SizedBox(
            height: 64,
          ),
          if (ctl.formType == ComeFormType.contact) ...[
            Center(
              child: FillButton(
                onPressed: ctl.onSendMessage,
                title: 'Send Message',
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            Center(
              child: BorderButton(
                onPressed: ctl.onDeleteChat,
                title: '        Delete        ',
                textColor: AppColors.mainDarkRedColor,
              ),
            ),
          ] else ...[
            Center(
              child: FillButton(
                onPressed: ctl.onAddAsContact,
                title: '    Add as Contact    ',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: BorderButton(
                onPressed: ctl.onDeleteChat,
                title: 'Remove from group',
                textColor: AppColors.mainDarkRedColor,
              ),
            ),
          ]
        ],
      );

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.only(
          left: 13.0,
          right: 13.0,
          top: 11,
          bottom: 11,
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.mainBlueColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Jack Shen',
                    style: AppTextStyles.black_15,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '@shenwei:sub1:thetranches.com',
                    style: AppTextStyles.grey_10,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
