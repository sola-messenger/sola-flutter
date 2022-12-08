import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_content_item.dart';
import 'package:sola/pages/contact_modular/contacts/views/contact_tap_item.dart';
import '../contacts/views/contact_title_item.dart';
import 'contact_group_controller.dart';

class ContactGroupPage extends GetView<ContactGroupController> {
  const ContactGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactGroupController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Group'.tr),
              centerTitle: true,
              actions: [
                IconButton(onPressed: ctl.onNavSearch, icon: Icon(Icons.search),),
              ],
            ),
            body: _buildView(ctl),
          );
        });
  }

  Widget _buildView(ContactGroupController ctl) => ListView(
    children: [
      ContactTapItem(icon: 'icon', title: 'Create Group', onTap: ctl.onCreateGroup),
        const ContactTitleItem(title: 'Frequent Contacts'),
          const ConatctContentItem(
            img: '',
            title: '张七',
            content: 'DCS Card',
          ),
          const ConatctContentItem(
            img: '',
            title: 'AAA',
            content: 'DCS Card',
          ),
          const ConatctContentItem(
            img: '',
            title: 'DDD',
            content: 'DCS Card',
          ),
          const ConatctContentItem(
            img: '',
            title: 'FFF',
            content: 'DCS Card',
          ),
    ],
  );
}
