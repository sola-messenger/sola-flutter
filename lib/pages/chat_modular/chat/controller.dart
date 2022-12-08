import 'package:get/get.dart';
import 'package:sola/common/routers/index.dart';

class ChatController extends GetxController {
  ChatController();

  _initData() {
    update(["chat"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void onChangeOrg() {
  }

  void onAdd() {
  }

  void onCreateGroup() {
    Get.toNamed(Routers.createGroupRoute);
  }
}
