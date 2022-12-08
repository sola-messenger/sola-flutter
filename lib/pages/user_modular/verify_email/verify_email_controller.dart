import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';

class VerifyEmailController extends GetxController {
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

  void onResend() {
    Get.toNamed(Routers.resetPasswordRoute);
  }
}
