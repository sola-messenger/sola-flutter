import 'package:get/get.dart';
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
}
