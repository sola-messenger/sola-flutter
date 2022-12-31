import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_image/crop_image.dart';

class CropImageController extends GetxController {
  String? imagePath = Get.parameters['imagePath'];
  final cropController =
      CropController(defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9));
  Rx<Image?> cropImage = (null as Image?).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    cropController.dispose();
  }

  void onCancel() {
    // Get.back();
    cropImage.value = null;
    cropImage.refresh();
  }

  void onRotate() {}

  void onFlip() {}

  void onFlip2() {}

  void onCrop() async {
    cropImage.value = await cropController.croppedImage();
    cropImage.refresh();
  }

  void onDone() async {
    final result = await cropController.croppedBitmap();
    Get.back();
    Get.back(result: result);
  }
}
