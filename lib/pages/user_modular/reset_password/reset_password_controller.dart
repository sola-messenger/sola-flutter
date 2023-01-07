// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/congratulations_dialog.dart';

class ResetPasswordController extends GetxController {
  final formGroup = FormGroup({
    'opwd': FormControl(
      validators: [Validators.required],
    ),
    'pwd': FormControl(
      validators: [Validators.required],
    ),
    'cpwd': FormControl(
      validators: [Validators.required],
    ),
  });

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onConfirm() {
    DialogUtils.showDialog(
        child: CongratulationsDialog(
      onContinue: () {
        Get.offAllNamed(Routers.indexRoute);
      },
      content: '''Your password has been 
reset successfully''',
    ));
  }
}
