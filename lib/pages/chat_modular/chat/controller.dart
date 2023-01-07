// Package imports:
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/bottom_sheet/invite_bottom_sheet.dart';
import 'package:sola/common/widgets/dialog/auto_delete_history_dialog.dart';
import 'package:sola/common/widgets/dialog/content_dialog.dart';
import 'package:sola/common/widgets/dialog/delete_history_dialog.dart';
import 'package:sola/pages/index_page/index_page_controller.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class ChatController extends GetxController {
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
    Get.find<IndexPageController>().openDrawer();
  }

  void onAdd() {
    Get.toNamed(Routers.addContactRoute);
  }

  void onCreateGroup() {
    Get.toNamed(Routers.createGroupRoute);
  }

  void onDeleteChat(Room room) {
    DialogUtils.showDialog(
        child: DeleteHistoryDialog(
      onCancel: () {},
      onConfirm: () async {
        await showFutureLoadingDialog(
          context: Get.overlayContext!,
          future: () async {
            await room.leave();
          },
        );
        Get.back();
      },
    ));
  }

  void onAutoDelete() {
    DialogUtils.showDialog(
        child: AutoDeleteHistoryDialog(
      onCancel: () {},
      onConfirm: () {},
    ));
  }

  void onNavToRoom(Room room) async{
    if (room.membership == Membership.invite) {
      final joinResult = await showFutureLoadingDialog(
          context: Get.overlayContext!,
          future: () async {
            final waitForRoom = room.client.waitForRoomInSync(
              room.id,
              join: true,
            );
            await room.join();
            await waitForRoom;
          });
      if (joinResult.error != null) return;
    }
    if (room.membership == Membership.ban) {
      DialogUtils.showDialog(
        child: ContentDialog(
          content: L10n.of(Get.context!)!.youHaveBeenBannedFromThisChat,
        ),
      );
      return;
    }

    if (room.membership == Membership.leave) {
      // final action = await showModalActionSheet<ArchivedRoomAction>(
      //   context: context,
      //   title: L10n.of(context)!.archivedRoom,
      //   message: L10n.of(context)!.thisRoomHasBeenArchived,
      //   actions: [
      //     SheetAction(
      //       label: L10n.of(context)!.rejoin,
      //       key: ArchivedRoomAction.rejoin,
      //     ),
      //     SheetAction(
      //       label: L10n.of(context)!.delete,
      //       key: ArchivedRoomAction.delete,
      //       isDestructiveAction: true,
      //     ),
      //   ],
      // );
      // if (action != null) {
      //   switch (action) {
      //     case ArchivedRoomAction.delete:
      //       await archiveAction(context);
      //       break;
      //     case ArchivedRoomAction.rejoin:
      //       await showFutureLoadingDialog(
      //         context: context,
      //         future: () => room.join(),
      //       );
      //       break;
      //   }
      // }
    }
    if (room.membership == Membership.join) {
      // Share content into this room
      // final shareContent = Matrix.of(context).shareContent;
      // if (shareContent != null) {
      //   final shareFile = shareContent.tryGet<MatrixFile>('file');
      //   if (shareContent.tryGet<String>('msgtype') ==
      //       'chat.fluffy.shared_file' &&
      //       shareFile != null) {
      //     await showDialog(
      //       context: context,
      //       useRootNavigator: false,
      //       builder: (c) => SendFileDialog(
      //         files: [shareFile],
      //         room: room,
      //       ),
      //     );
      //   } else {
      //     room.sendEvent(shareContent);
      //   }
      //   Matrix.of(context).shareContent = null;
      // }
      Get.toNamed(Routers.chatDetailRoute, parameters: {
        'roomId': room.id,
      });
    }
  }

  void onNavToPersonInfo(Room room) async {
    final directChatMatrixID = room.directChatMatrixID;
    if (directChatMatrixID != null) {
      Get.toNamed(Routers.memberInfoRoute, parameters: {
        'roomId': room.id,
      });
    } else {
      Get.toNamed(Routers.contactGroupSetRoute, parameters: {
        'roomId': room.id,
      });
    }
  }

  void onScanQrCode() {
    Get.toNamed(Routers.scanQrCodeRoute);
  }
}
