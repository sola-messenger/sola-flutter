import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/r.dart';
import 'crop_image_controller.dart';
import 'package:crop_image/crop_image.dart';

class CropImagePage extends GetView<CropImageController> {
  const CropImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CropImageController(),
        id: 'crop image',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Rotate And Crop'),
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
            body: _buildViews(ctl),
          );
        });
  }

  Widget _buildViews(CropImageController ctl) => Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: const Color(0xCC353434),
              child: SafeArea(
                child: Obx(
                  () => CropImage(
                    controller: ctl.cropController,
                    image: ctl.cropImage.value != null
                        ? ctl.cropImage.value!
                        : Image.file(
                            File(ctl.imagePath!),
                            fit: BoxFit.fitWidth,
                          ),
                    minimumImageSize: 50,
                    alwaysShowThirdLines: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                  title: 'ROTATE',
                  image: R.assetsIconRotateIcon,
                  onTap: ctl.onRotate),
              _buildButton(
                  title: 'FLIP',
                  image: R.assetsIconFlipIcon,
                  onTap: ctl.onFlip),
              _buildButton(
                  title: 'FLIP',
                  image: R.assetsIconFlipIcon2,
                  onTap: ctl.onFlip2),
              _buildButton(
                  title: 'CROP', image: R.assetsIconCropIcon, onTap: ctl.onCrop)
            ],
          ),
          const SizedBox(
            height: 31,
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      R.assetsIconDeleteBlueIcon,
                      width: 13,
                      height: 13,
                    )),
                IconButton(
                    onPressed: ctl.onDone,
                    icon: Image.asset(
                      R.assetsIconDoneIcon,
                      width: 17,
                      height: 13,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      );

  Widget _buildButton(
      {required String title,
      required String image,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 54,
          height: 65,
          decoration: const BoxDecoration(
            color: Color(0x1A353434),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Ink.image(
                image: AssetImage(image),
                width: 18,
                height: 18,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0x99353434),
                  fontSize: 8,
                  height: 22 / 8,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
