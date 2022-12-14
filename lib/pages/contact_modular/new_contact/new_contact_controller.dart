import 'package:get/get.dart';
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
