import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_image/crop_image.dart';

class CropImageController extends GetxController {
  String? imagePath = Get.parameters['imagePath'];
  final cropController =
      CropController(defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9));

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onCancel() {
    Get.back();
  }

  void onRotate() {
  }

  void onFlip() {
  }

  void onFlip2() {
  }

  void onCrop() {
  }
}
