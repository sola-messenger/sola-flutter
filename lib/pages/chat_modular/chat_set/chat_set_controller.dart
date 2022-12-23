// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';

class ChatSetController extends GetxController {
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

  void onNavPersonalInfo() {
      Get.toNamed(Routers.memberInfoRoute);
  }

  void onCreateGroup() {
    Get.toNamed(Routers.createGroupRoute);
  }
}
