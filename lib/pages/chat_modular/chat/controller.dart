// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/bottom_sheet/invite_bottom_sheet.dart';
import 'package:sola/common/widgets/dialog/auto_delete_history_dialog.dart';
import 'package:sola/common/widgets/dialog/delete_history_dialog.dart';
import 'package:sola/pages/index_page/index_page_controller.dart';

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


  void onDeleteChat() {
    DialogUtils.showDialog(
        child: DeleteHistoryDialog(
      onCancel: () {},
      onConfirm: () {},
    ));
  }

  void onAutoDelete() {
    DialogUtils.showDialog(
        child: AutoDeleteHistoryDialog(
      onCancel: () {},
      onConfirm: () {},
    ));
  }
}
