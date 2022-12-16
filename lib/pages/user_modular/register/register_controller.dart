// Package imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/contact_service_dialog.dart';
import 'package:sola/common/widgets/dialog/please_contact_dialog.dart';

class RegisterController extends GetxController {
  RxBool isAgreePrivacy = false.obs;
  FormGroup formGroup = FormGroup({
    'inviteCode': FormControl(validators: [Validators.required]),
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onChangePrivacyCheckBox() {
    isAgreePrivacy.call(!isAgreePrivacy.value);
    isAgreePrivacy.refresh();
  }

  void onNavTermsPage() {}

  void onNavPrivacy() {}

  void onRegister() {
    Get.offNamed(Routers.registerSetLoginInfoRoute);
  }

  void onNavLogin() {
    Get.offNamed(Routers.loginRoute);
  }

  void onShowService() {
    formGroup.unfocus();
    DialogUtils.showDialog(child: const ContactServiceDialog());
  }

  void onCreateOrg() {}

  void onJoinOrganization() {
    formGroup.unfocus();
    DialogUtils.showDialog(child: const PleaseContactDialog());
  }
}
