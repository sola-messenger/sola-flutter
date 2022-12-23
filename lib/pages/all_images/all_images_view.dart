import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/sola_radio_box.dart';
import 'package:sola/r.dart';
import 'all_images_controller.dart';

class AllImagesPage extends GetView<AllImagesController> {
  const AllImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AllImagesController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                  onTap: () {
                    ctl.onShowAllGallery();
                  },
                  child: Text('All Images'.tr)),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: GestureDetector(
                      onTap: ctl.onCancel,
                      child: Text(
                        'Cancel'.tr,
                        style: const TextStyle(
                          color: Color(0x99353434),
                          fontSize: 10,
                          height: 22 / 10,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            bottomNavigationBar: _buildBottomBar(ctl),
            body: SafeArea(
              child: _buildViews(ctl),
            ),
          );
        });
  }

  Widget _buildBottomBar(AllImagesController ctl) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 17,
        ),
        color: const Color(0xFFEAEAEA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ctl.onSelectAll,
              child: const Text(
                'Select All',
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: ctl.onSend,
              child: const Text(
                'Send',
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildViews(AllImagesController ctl) => Obx(
        () => ctl.imageList.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 83 / 78,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    _buildItems(ctl, context, index),
                itemCount: ctl.imageList.length + 1,
              )
            : Container(),
      );

  Widget _buildItems(AllImagesController ctl, BuildContext context, int index) {
    bool isShowCamera = index == 0;
    late Widget child;
    if (isShowCamera) {
      child = Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainBlueColor),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          R.assetsIconCameraIcon,
          width: 50,
          height: 50,
        ),
      );
    } else {
      final image = ctl.imageList[index - 1];
      child = FutureBuilder(
        future: image.file,
        builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
          return snapshot.hasData
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: ExtendedImage.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 3,
                        child: SolaRadioBox(isSelect: false, onChange: () {})),
                  ],
                )
              : Container();
        },
      );
    }
    return child;
  }
}
