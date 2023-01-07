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
    return GetBuilder(
        init: SettingsController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Settings'.tr),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(SettingsController ctl) => ListView(
        children: [
          Obx(
            () => MyRadioListTile(
              title: 'Mute Notification',
              isSelect: ctl.isMute.isTrue,
              onTap: ctl.onChangeMute,
            ),
          ),
          Obx(() => MyRadioListTile(
                title: 'Friends Permission',
                isSelect: ctl.isFriendPermission.isTrue,
                onTap: ctl.onChangeFriendsPermission,
              )),
          Obx(() => MyRadioListTile(
                title: 'Auto Delete Chat',
                isSelect: ctl.isAutoDelete.isTrue,
                onTap: ctl.onChangeAutoDeleteChat,
              )),
        ],
      );
}
