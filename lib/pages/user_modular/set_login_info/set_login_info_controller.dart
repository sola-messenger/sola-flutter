// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/congratulations_dialog.dart';

class SetLoginInfoController extends GetxController {
  FormGroup formGroup = FormGroup({
    'userName': FormControl(validators: [Validators.required]),
    'password': FormControl(validators: [Validators.required]),
  });
  void onConfirm() {
    DialogUtils.showDialog(child: CongratulationsDialog(onContinue: () {
      Get.toNamed(Routers.orgSetInfoRoute);
    }));
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
