// Package imports:
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/confirm_dialog.dart';

enum ComeFormType {
  contact,
  group,
}

class MemberInfoController extends GetxController {
  final roomId = Get.parameters['roomId'];

  Profile? profile;

  Room? room;

  final formType =
      ComeFormType.values[int.parse(Get.parameters['formType'] ?? '0')];

  @override
  void onInit() async {
    super.onInit();
    if (roomId != null) {}
    room = Get.find<ClientService>().client.getRoomById(roomId!);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onAddAsContact() {}

  void onRemoveFromGroup() {}

  void onSendMessage() {
    Get.offNamedUntil(Routers.chatDetailRoute,
        (route) => route.settings.name == Routers.indexRoute,
        parameters: {
          'roomId': roomId!,
        });
  }

  void onDeleteChat() {
    DialogUtils.showDialog(
        child: ConfirmDialog(
            title: 'Delete Chat',
            content: 'Are you sure?',
            onCancel: () {},
            onConfirm: () async {
              await showFutureLoadingDialog(
                context: Get.overlayContext!,
                future: () async {
                  await room!.leave();
                },
              );
              Get.back();
            }));
  }
}
