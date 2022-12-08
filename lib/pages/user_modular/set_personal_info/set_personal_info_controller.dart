import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  }

  void onSkip() {
  }
}
