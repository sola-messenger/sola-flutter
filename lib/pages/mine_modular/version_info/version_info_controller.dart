import 'package:get/get.dart';
import 'package:sola/widgets/dialog/upgrade_dialog.dart';

class VersionInfoController extends GetxController {
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

  void onUpdate() {
    Get.dialog(UpgradeDialog(
        onUpgrade: () {
          Get.back();
        },
        versionName: '1.0.2',
        updateInfo: """Bugs fixed, and improvements
the onboarding process. You will be asked to log in with your Singpass and to grant TranSwap access to your personal data. Please note that this option will automatically fill out some of the fields about your personal information."""));
  }
}
