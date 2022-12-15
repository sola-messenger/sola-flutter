// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class ForgotPasswordController extends GetxController {

  final formGroup = FormGroup({
    'userName': FormControl(
      validators: [Validators.required]
    ),
  });
  
  /// 确认
    void onConfirm(){
      Get.toNamed(Routers.verifyEmailRoute);
    }
    @override
    void onInit() {
    super.onInit();
    }

    @override
    void onReady() {}

    @override
    void onClose() {}

}
