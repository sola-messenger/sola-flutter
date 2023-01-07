// Package imports:
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/content_dialog.dart';

class ContactGroupSetController extends GetxController {
  String? roomId = Get.parameters['roomId'];
  Rx<Room?> room = (null as Room?).obs;
  RxList<User> members = <User>[].obs;

  @override
  void onInit() async {
    super.onInit();
    room.value = Get.find<ClientService>().client.getRoomById(roomId!);
    members.call(room.value!.getParticipants());
    members.refresh();
    // final participants = await showFutureLoadingDialog(
    //     context: Get.context!, future: () => room.value!.requestParticipants());
    // if (participants.error == null) {
    //   members.call(participants.result);
    //   members.refresh();
    // }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onMoreMembers() {}

  void onLeaveGroup() {}

  void onNavMemberInfo(User memberId) {
    Get.toNamed(Routers.memberInfoRoute, parameters: {
      'formType': '1',
    });
  }

  void onNavManageGroup() {
    Get.toNamed(Routers.manageGroupRoute);
  }

  void onViewMoreMembers() {}

  void onAddMember() {}

  void onRemoveMember() {}

  void onChangeDescription() async {
    final input = await showTextInputDialog(
      useRootNavigator: false,
      context: Get.overlayContext!,
      title: L10n.of(Get.context!)!.setGroupDescription,
      okLabel: L10n.of(Get.context!)!.ok,
      cancelLabel: L10n.of(Get.context!)!.cancel,
      textFields: [
        DialogTextField(
          hintText: L10n.of(Get.context!)!.setGroupDescription,
          initialText: room.value!.topic,
          minLines: 1,
          maxLines: 4,
        )
      ],
    );
    if (input == null) return;
    final success = await showFutureLoadingDialog(
      context: Get.overlayContext!,
      future: () => room.value!.setDescription(input.single),
    );
    if (success.error == null) {
      DialogUtils.showDialog(
          child: ContentDialog(
              content: L10n.of(Get.context!)!.groupDescriptionHasBeenChanged));
    }
  }
}
