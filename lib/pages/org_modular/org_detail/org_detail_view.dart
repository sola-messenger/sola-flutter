// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

// Project imports:
import 'package:sola/pages/contact_modular/contacts/views/contact_group_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_member_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_not_joined_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_owner_item.dart';
import 'package:sola/r.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOrgTapItem(
                    title: 'Organization Info',
                    img: R.assetsIconOrgInfoIcon,
                    onTap: ctl.onNavManageInfo),
                _buildOrgTapItem(
                    title: 'Exit Organization',
                    img: R.assetsIconExitOrgIcon,
                    onTap: ctl.onExitOrg),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ContactTitleItem(
            title: 'Administrators',
            action: Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'Add+',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.mainBlueColor,
                    fontSize: 10,
                    height: 23 / 10,
                  ),
                ),
              ),
            ),
          ),
          const ContactOwnerItem(
            img: '',
            title: '张七',
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
          const Padding(
            padding: EdgeInsets.only(left: 155.0),
            child: Text(
              'Invite Code',
              style: TextStyle(
                color: Color(0xfF848484),
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 15 / 10,
              ),
            ),
          ),
          ContactNotJoinedItem(
            onCopy: () {},
            inviteCode: 'SDF123',
          ),
          ContactNotJoinedItem(
            onCopy: () {},
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
            Image.asset(
              img,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xCC353434),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Container _buildOrgHeader(OrgDetailController ctl) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0x4A3C3C43),
            width: 0.33,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(4),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0x1A353434),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Member upper limit',
                      style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontSize: 10,
                        height: 22 / 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '50',
                      style: TextStyle(
                        color: AppColors.mainBlueColor,
                        fontSize: 10,
                        height: 23 / 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(4),
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0x1A353434),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Expiry Date',
                      style: TextStyle(
                        color: AppColors.textBlackColor,
                        fontSize: 10,
                        height: 22 / 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '05 Oct 2022',
                      style: TextStyle(
                        color: AppColors.mainBlueColor,
                        fontSize: 10,
                        height: 23 / 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }
}
