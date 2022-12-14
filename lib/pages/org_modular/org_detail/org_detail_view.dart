import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_group_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_member_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_not_joined_item.dart';
import '../../contact_modular/contacts/views/contact_content_item.dart';
import '../../contact_modular/contacts/views/contact_title_item.dart';
import 'org_detail_controller.dart';

class OrgDetailPage extends GetView<OrgDetailController> {
  const OrgDetailPage({Key? key}) : super(key: key);

  Widget _buildView(OrgDetailController ctl) => ListView(
        children: [
          _buildOrgHeader(ctl),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOrgTapItem(
                  title: 'Manage Info', img: '', onTap: ctl.onNavManageInfo),
              _buildOrgTapItem(
                  title: 'Invite Members', img: '', onTap: ctl.onInviteMembers),
              _buildOrgTapItem(
                  title: 'Exit\nOrganization', img: '', onTap: ctl.onExitOrg),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ContactTitleItem(
            title: 'Administrators',
            action: InkWell(
                onTap: () {},
                child: const Text(
                  'Add+',
                  textAlign: TextAlign.center,
                )),
          ),
          const ContactContentItem(
            img: '',
            title: '张七',
            content: 'DCS Card',
          ),
          const ContactTitleItem(
            title: 'Group',
          ),
          const ContactGroupItem(
            img: '',
            title: 'AAA',
            createdBy: 'Alien Card',
          ),
          const ContactGroupItem(
            img: '',
            title: 'DDG',
            createdBy: 'zhange',
          ),
          const ContactTitleItem(
            title: 'Members',
          ),
          ContactMemberItem(
            img: '',
            title: 'DDG',
            onRemove: () {},
          ),
          ContactNotJoinedItem(
            onCopy: (){},
            inviteCode: 'SDF123',
          ),
          ContactNotJoinedItem(
            onCopy: (){},
            inviteCode: 'SDF123',
          ),
        ],
      );

  Widget _buildOrgTapItem(
          {required String title,
          required String img,
          required VoidCallback onTap}) =>
      InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(title),
          ],
        ),
      );

  Container _buildOrgHeader(OrgDetailController ctl) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Member upper limit'),
              SizedBox(
                height: 8,
              ),
              Text('50'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Expiry Date'),
              SizedBox(
                height: 8,
              ),
              Text('05 Oct 2020'),
            ],
          ),
          TextButton(
              onPressed: ctl.onUpgrade, child: Text('Renewal/upgrade'.tr)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrgDetailController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Central China Normal University'.tr),
              actions: [
                IconButton(
                    onPressed: ctl.onSearch, icon: const Icon(Icons.search)),
              ],
            ),
            body: _buildView(ctl),
          );
        });
  }
}
