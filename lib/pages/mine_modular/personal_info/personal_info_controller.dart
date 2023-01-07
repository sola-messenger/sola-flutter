// Package imports:
import 'dart:typed_data';

import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/routers/index.dart';
import 'dart:ui' as ui;

import 'package:sola/common/services/client_service.dart';

class PersonalInfoController extends GetxController {
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

  void onEditDisplayName() {}

  void onEditEmail() {}

  void onEditUserId() {}

  void onChangeAvatar() async {
    final result = await Get.toNamed(Routers.allImageRoute, parameters: {
      'model': 'single',
    });
    if (result != null) {
      ByteData? data = await result.toByteData(format: ui.ImageByteFormat.png);
      final file = MatrixFile(
        bytes: data!.buffer.asUint8List(),
        name: '${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await showFutureLoadingDialog(
        context: Get.overlayContext!,
        future: () => Get.find<ClientService>().client.setAvatar(file),
      );
    }
  }

  void onNavQrCode() {
    Get.toNamed(Routers.myQrcodeRoute);
  }
}
