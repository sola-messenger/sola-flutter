import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';

class ContactGroupController extends GetxController {
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

  void onCreateGroup() {
    Get.toNamed(Routers.createGroupRoute);
  }

  void onNavSearch() {
    Get.toNamed(Routers.contactGroupSetRoute);

  }

  void onNavDetail() {
    Get.toNamed(Routers.contactGroupSetRoute);
  }
}
