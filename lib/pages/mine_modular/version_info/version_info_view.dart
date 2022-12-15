// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/services/info_service.dart';
import 'version_info_controller.dart';

class VersionInfoPage extends GetView<VersionInfoController> {
  const VersionInfoPage({Key? key}) : super(key: key);

  Widget _buildView(VersionInfoController ctl) => ListView(
    children: [
      const SizedBox(
        height: 64,
      ),
       Center(
         child: Container(
          width: 40,
          height: 40,
          color: Colors.blue,
      ),
       ),
      const SizedBox(
        height: 12,
      ),
      const Center(
        child: Text('Sola',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
      ),
      const SizedBox(
        height: 16,
      ),
      Center(child: Text('Version ${Get.find<InfoService>().packageInfo.version}')),
      const SizedBox(
        height: 64,
      ),
      InkWell(
        onTap: ctl.onUpdate,
        child: Ink(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
            ),
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Version Update'.tr),
            const SizedBox(
              width: 16,
            ),
            const Expanded(child: Text('1.0.3')),
            const Text('Update'),
            const Icon(Icons.arrow_right),
          ],
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
            ),
            body: _buildView(ctl),
          );
        });
  }

}
