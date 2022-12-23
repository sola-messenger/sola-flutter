// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

// Project imports:
import 'package:sola/pages/mine_modular/mine/views/mine_setting_item.dart';
import 'package:sola/r.dart';
import 'index.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context, MineController ctl) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // _buildUserHeader(context, ctl),
        const SizedBox(
          height: 16,
        ),
        // MineSettingItem(title: 'QR Code', image: '', onTap: ctl.onNavQRCode),
        const SizedBox(
          height: 16,
        ),
        MineSettingItem(
          title: 'My Organization',
          image: R.assetsIconMyOrgIcon,
          onTap: ctl.onNavOrganzation,
          right: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('50 limit'),
              SizedBox(
                width: 11,
              ),
              Text('Sola'),
            ],
          ),
        ),
        MineSettingItem(
          title: 'Language',
          image: R.assetsIconLanguageIcon,
          onTap: ctl.onNavOrganzation,
          right: const Text('English (United States)'),
        ),
        MineSettingItem(
          title: 'Security & Privacy',
          image: R.assetsIconSecurityIcon,
          onTap: ctl.onNavOrganzation,
          right: const Text('V1.0.1'),
        ),
        MineSettingItem(
            title: 'Change Password',
            image: R.assetsIconChangePasswordIcon,
            onTap: ctl.onNavChangePassword),
        MineSettingItem(
            title: 'About Us',
            image: R.assetsIconSIcon,
            onTap: ctl.onNavAboutUs),
        MineSettingItem(
          title: 'Version',
          image: R.assetsIconVersionIcon,
          onTap: ctl.onNavVersion,
          right: const Text('V1.0.1'),
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
            onPressed: ctl.onLogout,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  R.assetsIconLogOutIcon,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'LOG OUT'.tr,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 22 / 15,
                    color: AppColors.mainRedColor,
                  ),
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: AppColors.mainBlueColor,
            ),
            centerTitle: false,
            title: InkWell(
              onTap: ctl.onNavPersonalInfo,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.mainBlueColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    'Eric Fang',
                    style: TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 15,
                      height: 22 / 15,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: ctl.onNavSettings, icon: const Icon(Icons.menu)),
            ],
          ),
          body: _buildView(context, ctl),
        );
      },
    );
  }
}
