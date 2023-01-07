import 'package:get/get.dart';
import 'package:sola/r.dart';

class PrivacyAndTermsController extends GetxController {
  String? type = Get.parameters['type'];

  String get image => type == 'Privacy Policy'
      ? R.assetsIconPrivacyPolicy
      : R.assetsIconTermsAndConditions;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
