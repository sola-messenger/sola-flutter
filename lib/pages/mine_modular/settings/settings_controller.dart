// Package imports:
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool isMute = false.obs;
  RxBool isFriendPermission = false.obs;
  RxBool isAutoDelete = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onChangeMute() {
    isMute.toggle();
    isMute.refresh();
  }

  void onChangeFriendsPermission() {
    isFriendPermission.toggle();
    isFriendPermission.refresh();
  }

  void onChangeAutoDeleteChat() {
    isAutoDelete.toggle();
    isAutoDelete.refresh();
  }
}
