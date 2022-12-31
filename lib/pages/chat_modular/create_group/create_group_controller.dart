// Package imports:
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/privacy_level_dialog.dart';
import 'package:matrix/matrix.dart' as sdk;

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

  void onFinish() async {
    final groupName = fromGroup
        .control('groupName')
        .value;

    final client = Get
        .find<ClientService>()
        .client;
    final roomID = await showFutureLoadingDialog(
      context: Get.overlayContext!,
      future: () async {
        final roomId = await client.createGroupChat(
          preset: privacyLevel.value
              ? sdk.CreateRoomPreset.publicChat
              : sdk.CreateRoomPreset.privateChat,
          groupName: groupName,
        );
        return roomId;
      },
    );
    if (roomID.error == null) {
      Get.offNamed(Routers.chatDetailRoute, parameters: {
        'roomId': roomID.result!,
      });
      // VRouter.of(context).toSegments(['rooms', roomID.result!, 'invite']);
    }
    // Get.toNamed(Routers.selectMembersRoute, parameters: {
    //   'action': 'create group',
    // });
  }

  void onShowPrivacyLevelInfo() {
    DialogUtils.showDialog(child: PrivacyLevelDialog(onConfirm: () {}));
  }
}
