// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
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
          MyRadioListTile(title: 'Mute Notification', isSelect: false),
          MyRadioListTile(title: 'Friends Permission', isSelect: false),
          MyRadioListTile(title: 'Auto Delete Chat', isSelect: false),
        ],
      );
}
