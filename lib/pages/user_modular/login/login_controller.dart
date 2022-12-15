// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class LoginController extends GetxController {
  final form = FormGroup({
    'userName': FormControl(
      validators: [Validators.required],
    ),
    'password': FormControl(
      validators: [Validators.required],
    ),
    'orgName':FormControl(
      validators: [Validators.required],
    )
  });


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onLogin() {
    Get.offNamed(Routers.indexRoute);
  }

  void onRegister() {
    Get.offNamed(Routers.registerRoute);
  }

  void onForgotPassword() {
    Get.toNamed(Routers.forgotPasswordRoute);
  }

}
