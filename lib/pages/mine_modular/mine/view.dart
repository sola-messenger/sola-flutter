// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/pages/mine_modular/mine/views/mine_setting_item.dart';
import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context, MineController ctl) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildUserHeader(context,ctl),
        const SizedBox(
          height: 16,
        ),
        MineSettingItem(title: 'QR Code', image: '', onTap: ctl.onNavQRCode),
        const SizedBox(
          height: 16,
        ),
        MineSettingItem(
            title: 'My Organization', image: '', onTap: ctl.onNavOrganzation),
        MineSettingItem(
            title: 'Language', image: '', onTap: ctl.onNavOrganzation),
        MineSettingItem(
            title: 'Settings', image: '', onTap: ctl.onNavSettings),
        MineSettingItem(
            title: 'Change Password',
            image: '',
            onTap: ctl.onNavChangePassword),
        MineSettingItem(title: 'About Us', image: '', onTap: ctl.onNavAboutUs),
        MineSettingItem(title: 'Version', image: '', onTap: ctl.onNavVersion),
        const SizedBox(
          height: 16,
        ),
        TextButton(onPressed: ctl.onLogout, child: Text('Log Out'.tr))
      ],
    );
  }

  Widget _buildUserHeader(BuildContext context,MineController ctl) {
    return InkWell(
      onTap: ctl.onNavPersonalInfo,
      child: Ink(
        color: Theme.of(context).primaryColor,
        height: Get.mediaQuery.padding.top + 120,
        padding: EdgeInsets.only(
          top: Get.mediaQuery.padding.top,
          right: 8,
          left: 8,
          bottom: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Expanded(
              child: Text(
                'Eric Fang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (ctl) {
        return Scaffold(
          body: _buildView(context, ctl),
        );
      },
    );
  }
}
