// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';

class ChatSetController extends GetxController {
  final roomId = Get.parameters['roomId'];
  Room? room;
  RxBool isPin = false.obs;
  RxBool isMute = false.obs;
  RxBool isPrivacy = false.obs;

  @override
  void onInit() {
    super.onInit();
    room = Get.find<ClientService>().client.getRoomById(roomId!);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onNavPersonalInfo() {
    Get.toNamed(Routers.memberInfoRoute, parameters: {
      'roomId': roomId!,
    });
  }

  void onCreateGroup() {
    Get.toNamed(Routers.createGroupRoute);
  }

  void onChangePin() {
    isPin.toggle();
    isPin.refresh();
  }

  void onChangeMute() {
    isMute.toggle();
    isMute.refresh();
  }

  void onchangePrivacyLevel(bool value) {
    isPrivacy.call(value);
    isPrivacy.refresh();
  }
}
