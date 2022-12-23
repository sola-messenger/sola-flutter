// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/services/info_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';
import 'version_info_controller.dart';

class VersionInfoPage extends GetView<VersionInfoController> {
  const VersionInfoPage({Key? key}) : super(key: key);

  Widget _buildView(VersionInfoController ctl) => ListView(
        children: [
          const SizedBox(
            height: 64,
          ),
          Center(
            child: Image.asset(
              R.assetsIconSIcon,
              width: 61,
              height: 54,
              color: AppColors.mainBlueColor,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Image.asset(
              R.assetsIconSolaBlueIcon,
              width: 114,
              height: 31,
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Center(
              child: Text(
                  'Version ${Get.find<InfoService>().packageInfo.version}')),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: InkWell(
              onTap: ctl.onUpdate,
              child: Ink(
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.only(
                  left: 19,
                  right: 11,
                  top: 6,
                  bottom: 7,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    height: 22 / 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Version Update'.tr),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Center(
                              child: Text(Get.find<InfoService>()
                                  .packageInfo
                                  .version))),
                      const Text(
                        'Update',
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Image.asset(
                        R.assetsIconRightBlackIcon,
                        width: 8,
                        height: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VersionInfoController(),
        id: 'version info',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Version'.tr),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    R.assetsIconListMoreIcon,
                    width: 16,
                    height: 4,
                  ),
                ),
              ],
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }
}
