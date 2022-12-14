import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/index.dart';

class SetLoginInfoController extends GetxController {
  FormGroup formGroup = FormGroup({
    'userName': FormControl(validators: [Validators.required]),
    'password': FormControl(validators: [Validators.required]),
  });

  void onConfirm(){
    Get.offNamed(Routers.registerSuccessRoute);
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
