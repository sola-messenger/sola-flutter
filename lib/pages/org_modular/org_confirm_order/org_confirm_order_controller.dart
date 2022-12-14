import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/dialog/confirm_dialog.dart';

class OrgConfirmOrderController extends GetxController {
  final fromGroup = FormGroup({
    'cc': FormControl(validators: [Validators.required]),
    'mm': FormControl(validators: [Validators.required]),
    'yy': FormControl(validators: [Validators.required]),
    'cvv': FormControl(validators: [Validators.required]),
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onCheckout() {
    Get.toNamed(Routers.registerSuccessRoute, parameters: {
      'isCreateOrg': 'true',
    });
  }

  void onBack() {
    Get.dialog(ConfirmDialog(
        title: '',
        content: 'Are you sure you want to give up payment?',
        onCancel: () {},
        onConfirm: () {
          Get.back();
        }));
  }
}
