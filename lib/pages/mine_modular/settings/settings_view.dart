import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr),
      ),
      body: SafeArea(child: _buildView()),
    );
  }

  Widget _buildView() => ListView(
        children: const [
          MyRadioListTile(title: 'Private Chats', isSelect: false),
          MyRadioListTile(title: 'Group Chats', isSelect: false),
          MyRadioListTile(title: 'Voice Call', isSelect: false),
        ],
      );
}
