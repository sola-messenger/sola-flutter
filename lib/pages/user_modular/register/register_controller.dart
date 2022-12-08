import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/routers/index.dart';

class RegisterController extends GetxController {
  RxBool isAgreePrivacy = false.obs;
  FormGroup formGroup = FormGroup({
    'userName':FormControl(validators: [Validators.required]),
    'password':FormControl(validators: [Validators.required]),
    'inviteCode':FormControl(validators: [Validators.required]),
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onChangePrivacyCheckBox(bool? value) {
     isAgreePrivacy.call(value);
     isAgreePrivacy.refresh();
  }

  void onNavTermsPage() {
  }

  void onNavPrivacy() {
  }

  void onRegister() {
    Get.offNamed(Routers.registerSuccessRoute);
  }

  void onNavLogin() {
    Get.offNamed(Routers.loginRoute);
  }
}
