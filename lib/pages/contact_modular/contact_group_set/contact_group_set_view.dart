// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
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
            ),
            body: _buildView(ctl),
          );
        });
  }

  Widget _buildView(ContactGroupSetController ctl) => ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              children: List.generate(
                10,
                (index) => InkWell(
                  onTap: ctl.onNavMemberInfo,
                  child: Ink(
                    width: (Get.mediaQuery.size.width - 8 - 8 * 4) / 5,
                    height: (Get.mediaQuery.size.width - 8 - 8 * 4) / 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: ctl.onMoreMembers,
                child: const Text('View more members')),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            color: Colors.grey.withOpacity(0.5),
            height: 10,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Chat Name',
            content: 'Sola对接群',
          ),
          ClickListTile(
            title: 'Description',
            content: 'Sola对接专用',
          ),
          ClickListTile(
            onTap: () {},
            title: 'Group QR Code',
            content: '二维码',
          ),
          ClickListTile(
            onTap: () {},
            title: 'Remark',
            content: 'sjsjsjsj',
          ),
          ClickListTile(
            onTap: () {},
            title: 'Search Chat history',
            content: '',
          ),
          ClickListTile(
            onTap: () {},
            title: 'Clear My History',
            content: '',
          ),
          MyRadioListTile(
            onTap: () {},
            title: 'Sticky on Top',
            isSelect: true,
          ),
          ClickListTile(
            onTap: () {},
            title: 'My Alias in Group',
            content: 'Eric Fang',
          ),
          ClickListTile(
            onTap: ctl.onNavManageGroup,
            title: 'Manage Group',
            content: '',
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: ctl.onLeaveGroup, child: Text('Leave Group')),
        ],
      );
}
