// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/widgets/dialog/contact_service_dialog.dart';
import 'package:sola/common/widgets/dialog/please_contact_dialog.dart';

class RegisterController extends GetxController {
  RxBool isAgreePrivacy = false.obs;
  FormGroup formGroup = FormGroup({
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
    Get.offNamed(Routers.registerSetLoginInfoRoute);
  }

  void onNavLogin() {
    Get.offNamed(Routers.loginRoute);
  }

  void onShowService() {
    Get.dialog(const ContactServiceDialog());
  }

  void onCreateOrg() {
  }

  void onJoinOrganization() {
    Get.dialog(const PleaseContactDialog());

  }
}
