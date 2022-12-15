// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/pages/org_modular/org_order_detail/views/pay_now_bottom_sheet.dart';

class OrgOrderDetailController extends GetxController {
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

  void onPayNow() {
    Get.bottomSheet(PayNowBottomSheet(
      formGroup: fromGroup,
      onCheckout: () {},
    ),
      isScrollControlled: true,
    );
  }

  void onEditOrder() {}
}
