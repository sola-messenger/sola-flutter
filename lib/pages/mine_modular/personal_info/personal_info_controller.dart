// Package imports:
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
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

  void onEditDisplayName() {
  }

  void onEditEmail() {
    
  }

  void onEditUserId() {
  }
}
