// Package imports:
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';

class ContactInfoController extends GetxController {
  final userId = Get.parameters['userId'];
  Rx<bool> privacyLevel = false.obs;
  Rx<Profile?> profile = (null as Profile?).obs;

  @override
  void onInit() async {
    super.onInit();
    if (userId != null) {
      profile.call(
          await Get.find<ClientService>().client.getProfileFromUserId(userId!));
      profile.refresh();
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onAddAsContact() async {
    final result = await showFutureLoadingDialog<String>(
      context: Get.overlayContext!,
      future: () => Get.find<ClientService>().client.startDirectChat(userId!),
    );
    if (result.error == null) {
      Get.offNamed(Routers.chatDetailRoute, parameters: {
        'roomId': result.result!,
      });
      return;
    }
  }

  void onRemoveFromGroup() {}

  void onSeeMsgOnlyOnline() {}

  void onSeeMessageWithoutInternet() {}

  void onChangePrivacyLevel(bool value) {
    privacyLevel.call(value);
    privacyLevel.refresh();
  }
}
