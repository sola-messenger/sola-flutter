// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/privacy_level_dialog.dart';

class CreateGroupController extends GetxController {
  final fromGroup = FormGroup({
    'groupName': FormControl(validators: [Validators.required]),
    'desc': FormControl(validators: [Validators.required]),
  });

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

  void onFinish() {
    Get.toNamed(Routers.selectMembersRoute);
  }

  void onShowPrivacyLevelInfo() {
    DialogUtils.showDialog(
        child: PrivacyLevelDialog(onConfirm: () {}));
  }
}
