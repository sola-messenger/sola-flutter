// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/index.dart';

class MyQrcodeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onShareMycode() {

  }

  void onScanCode() {
    Get.toNamed(Routers.scanQrCodeRoute);
  }
}
