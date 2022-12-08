import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateGroupController extends GetxController {
  final count = 0.obs;
  final fromGroup = FormGroup({
    'groupName': FormControl(validators: [Validators.required]),
    'desc': FormControl(validators: [Validators.required]),
  });

  RxString privacyLevel = 'Private'.obs;
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

  increment() => count.value++;

  void onSelectPrivacyLevel(String? value) {
    privacyLevel.call(value);
    privacyLevel.refresh();
  }

  void onChangeAllowInvite(bool? value) {
    allowInvite.call(value);
    allowInvite.refresh();
  }

  void onChangeAllowAddFriends(bool? value) {
    allowAddFriend.call(value);
    allowAddFriend.refresh();
  }

  void onChangeInvitationApproval(bool? value) {
     invitationApproval.call(value);
    invitationApproval.refresh();
  }
}
