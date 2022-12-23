// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_content_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_tap_item.dart';
import 'package:sola/r.dart';
import '../contacts/views/contact_title_item.dart';
import 'contact_group_controller.dart';

class ContactGroupPage extends GetView<ContactGroupController> {
  const ContactGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactGroupController(),
        id: 'contact group',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Group'.tr),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: ctl.onNavSearch,
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: _buildView(ctl),
          );
        });
  }

  Widget _buildView(ContactGroupController ctl) => ListView(
        children: [
          ContactTapItem(
              icon: R.assetsIconAddContactsIcon, title: 'Create Group', onTap: ctl.onCreateGroup),
          const ContactTitleItem(title: 'I\'ve create Group'),
          ContactContentItem(
            img: '',
            title: '张七',
            content: 'DCS Card',
            onTap: ctl.onNavDetail,
          ),
          const ContactTitleItem(title: 'I\'ve joined Group'),
          ContactContentItem(
            img: '',
            title: 'AAA',
            content: 'DCS Card',
            onTap: ctl.onNavDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'DDD',
            content: 'DCS Card',
            onTap: ctl.onNavDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'FFF',
            content: 'DCS Card',
            onTap: ctl.onNavDetail,
          ),
        ],
      );
}
