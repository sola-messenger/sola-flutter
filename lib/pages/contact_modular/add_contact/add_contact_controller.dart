// Package imports:
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/content_dialog.dart';

class AddContactController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onNavMyQrCode() {
    Get.toNamed(Routers.myQrcodeRoute);
  }

  void onScanQrCode() {
    Get.toNamed(Routers.scanQrCodeRoute);
  }

  void onCopy(String userId) async {
    await Clipboard.setData(ClipboardData(text: userId));
    DialogUtils.showDialog(
        child: const ContentDialog(
      content: 'Copy Success!',
    ));
  }
}
