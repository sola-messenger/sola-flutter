import 'package:get/get.dart';

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

  void onScanQrcode() {
  }
}
