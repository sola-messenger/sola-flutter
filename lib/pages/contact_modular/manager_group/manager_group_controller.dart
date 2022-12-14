// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';

class ManagerGroupController extends GetxController {

  RxBool privacyLevel = false.obs;

  RxBool allowInvite = false.obs;
  RxBool allowAddFriend = false.obs;
  RxBool invitationApproval = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}


  void onSelectPrivacyLevel(bool? value) {
    privacyLevel.call(value);
    privacyLevel.refresh();
  }

  void onChangeAllowInvite() {
    allowInvite.call(!allowInvite.value);
    allowInvite.refresh();
  }

  void onChangeAllowAddFriends() {
    allowAddFriend.call(!allowAddFriend.value);
    allowAddFriend.refresh();
  }

  void onChangeInvitationApproval() {
    invitationApproval.call(!invitationApproval.value);
    invitationApproval.refresh();
  }

  void onRemoveGroup() {
  }

  void onNavGroupAdmin() {
    Get.toNamed(Routers.groupAdminRoute);
  }

  void onSelectAvatar() {
    Get.toNamed(Routers.allImageRoute,parameters: {
      'model':'single',
    });
  }
}
