import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EnterEmailController extends GetxController {
    FormGroup formGroup = FormGroup({
      'email':FormControl(
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


  void onNext() {
  }
}
