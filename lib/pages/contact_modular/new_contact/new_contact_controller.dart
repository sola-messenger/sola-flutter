// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/index.dart';

class NewContactController extends GetxController {
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

  void onAddContacts() {
      Get.toNamed(Routers.addContactRoute);
  }
}
