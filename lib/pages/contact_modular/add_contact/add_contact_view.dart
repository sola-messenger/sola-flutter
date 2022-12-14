import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'add_contact_controller.dart';

class AddContactPage extends GetView<AddContactController> {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddContactController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('New Contacts'.tr),
            ),
            body: SafeArea(child: _buildView()),
          );
        });
  }

  Widget _buildView() => ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          const SearchBar(
            title: 'Search User ID',
          ),
          const SizedBox(
            height: 12,
          ),
          ClickListTile(
            title: 'My User ID',
            content: '@shenweisub:thetranches.com',
            onTap: () {},
          ),
          ClickListTile(
            onTap: () {},
            title: 'My QR Code',
          ),
          ClickListTile(
            title: 'Scan QR Code',
            onTap: () {},
          ),
        ],
      );
}
