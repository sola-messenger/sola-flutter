// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/index.dart';

class SetPersonalInfoController extends GetxController {
    final count = 0.obs;

  FormGroup fromGroup = FormGroup({
    'displayName': FormControl(
      validators: [Validators.required]
    ),
  });

    @override
    void onInit() {
    super.onInit();
    }

    @override
    void onReady() {}

    @override
    void onClose() {}

    increment() => count.value++;

  void onSaveAndContinue() {
    Get.offAllNamed(Routers.indexRoute);
  }

  void onSkip() {
    Get.offAllNamed(Routers.indexRoute);
  }
}
