import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'member_info_controller.dart';

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
            height: 4,
            color: Colors.grey.withOpacity(0.5),
          ),
          const ClickListTile(
            title: 'Organization',
            content: 'DCC DEV',
          ),
          ClickListTile(
            title: 'Nickname',
            content: '申威',
            onTap: () {},
          ),
          ClickListTile(
            title: 'Description',
            content: 'shhhdhhhdhh  ddjdjjdjdjjdjjdhdhdhdddd',
            onTap: () {},
          ),
          if (ctl.formType == ComeFormType.contact)
            PrivacyLevelListTile(isPrivate: false, onChangePrivate: (value) {}),
          const SizedBox(
            height: 16,
          ),
          FormGroupWidget(children: [
            ClickListTile(
              title: 'Share to friends',
              onTap: () {},
            ),
          ]),
          const SizedBox(
            height: 64,
          ),
          if (ctl.formType == ComeFormType.contact) ...[
            ElevatedButton(
                onPressed: ctl.onSendMessage, child: Text('Send Message'.tr)),
            ElevatedButton(
                onPressed: ctl.onDeleteChat, child: Text('Delete'.tr)),
          ] else ...[
            ElevatedButton(
                onPressed: ctl.onAddAsContact,
                child: Text('Add as Contact'.tr)),
            ElevatedButton(
                onPressed: ctl.onRemoveFromGroup,
                child: Text('Remove from group'.tr)),
          ]
        ],
      );

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.only(
          left: 4.0,
          right: 4.0,
          top: 16,
          bottom: 4,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.red,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Jack Shen'),
                  SizedBox(
                    height: 3,
                  ),
                  Text('@shenwei:sub1:thetranches.com'),
                ],
              ),
            ),
          ],
        ),
      );
}
