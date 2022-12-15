// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class SplashController extends GetxController {
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

  void onCreateAccount() {
    Get.offNamed(Routers.registerRoute);
  }

  void onNavLogin() {
    Get.offNamed(Routers.loginRoute);
  }
}
