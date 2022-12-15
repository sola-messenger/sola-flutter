// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class RegisterSuccessController extends GetxController {
    final isCreateOrg = Get.parameters["isCreateOrg"];

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
    if(isCreateOrg == 'true'){
      Get.offNamed(Routers.orgOrderDetailRoute);
    }else{
      Get.offNamed(Routers.setPersonalRoute);
    }
  }
}
