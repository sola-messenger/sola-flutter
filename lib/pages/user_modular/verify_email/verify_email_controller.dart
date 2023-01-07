// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/congratulations_dialog.dart';

class VerifyEmailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onResend() {
    Get.toNamed(Routers.resetPasswordRoute);
  }

  void onShowSuccessDialog() {
    DialogUtils.showDialog(
        child: CongratulationsDialog(
      onContinue: () {
        Get.offNamed(Routers.resetPasswordRoute);
      },
      content: 'Your email address has been verified',
    ));
  }
}
