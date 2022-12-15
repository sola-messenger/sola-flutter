// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class ContactsController extends GetxController {
  ContactsController();

  _initData() {
    update(["contacts"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void onNavGroup() {
    Get.toNamed(Routers.groupRoute);
  }

  void onNavNewContact() {
    Get.toNamed(Routers.newContactRoute);
  }

  void onNavGroupNotification() {
    Get.toNamed(Routers.groupNotificationRoute);
  }

  void onNavContactDetail() {
    Get.toNamed(Routers.memberInfoRoute, parameters: {
      'formType': '0',
    });
  }
}
