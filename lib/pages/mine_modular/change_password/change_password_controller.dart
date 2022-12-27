// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordController extends GetxController {
    final formGroup = FormGroup({
      'ori_pwd':FormControl(
        validators: [Validators.required],
      ),
      'pwd':FormControl(
        validators: [Validators.required],
      ),
       'cpwd':FormControl(
        validators: [Validators.required],
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


  void onConfirm() {
  }
}
