// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/pages/contact_modular/contacts/views/contact_title_item.dart';
import 'package:sola/r.dart';
import 'index.dart';
import 'views/contact_content_item.dart';
import 'views/contact_tap_item.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(ContactsController ctl) {
    return Scrollbar(
      child: ListView(
        children: [
          ContactTapItem(
            onTap: ctl.onNavNewContact,
            title: 'New Contact',
            icon: R.assetsIconAddContactsIcon,
            hasNews: true,
          ),
          ContactTapItem(
            onTap: ctl.onNavGroup,
            title: 'Group',
            icon: R.assetsIconCreateGroupIcon,
          ),
          ContactTapItem(
            onTap: ctl.onNavGroupNotification,
            title: 'Group notification',
            icon: R.assetsIconGroupNotification,
          ),
          ContactTapItem(
            onTap: ctl.onNavGroupNotification,
            title: 'Organization Notification',
            icon: R.assetsIconOrgNotification,
          ),
          const ContactTitleItem(title: 'Frequent Contacts'),
          ContactContentItem(
            img: '',
            title: '张七',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'AAA',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'DDD',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'FFF',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
          const ContactTitleItem(title: 'A'),
          ContactContentItem(
            img: '',
            title: 'AAA',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
          ContactContentItem(
            img: '',
            title: 'AAB',
            content: 'DCS Card',
            onTap: ctl.onNavContactDetail,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsController>(
      init: ContactsController(),
      id: "contacts",
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  R.assetsIconSearchIcon,
                  width: 14,
                  height: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: _buildView(ctl),
        );
      },
    );
  }
}
