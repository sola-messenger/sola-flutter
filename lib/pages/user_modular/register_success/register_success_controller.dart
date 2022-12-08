import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';

class RegisterSuccessController extends GetxController {
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

  void onConfirm() {
    Get.offNamed(Routers.indexRoute);
  }
}
