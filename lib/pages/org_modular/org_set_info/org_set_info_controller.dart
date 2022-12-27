import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/index.dart';

class OrgSetInfoController extends GetxController {
  final count = 0.obs;
  RxString allowMembers = 'Allow'.obs;
  FormGroup formGroup = FormGroup({
    'orgName': FormControl(validators: [Validators.required]),
    'desc': FormControl(validators: [Validators.required]),
  });
  RxBool isAgree = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onSelectAllowMembers(String? value) {

  }

  void onChangePrivacyCheckBox() {
    isAgree.call(!isAgree.value);
    isAgree.refresh();
  }

  void onNavServiceAgreement() {
  }

  void onConfirm() {
    Get.toNamed(Routers.setPersonalRoute);
  }
}
