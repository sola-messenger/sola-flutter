// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class ResetPasswordController extends GetxController {
    final formGroup = FormGroup({
      'pwd':FormControl(
        validators: [Validators.required],
      ),
       'cpwd':FormControl(
        validators: [Validators.required],
      ),
    });

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
    Get.offAllNamed(Routers.indexRoute);
  }
}
