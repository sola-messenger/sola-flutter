// Package imports:
import 'package:get/get.dart';

enum ComeFormType {
  contact,
  group,
}

class MemberInfoController extends GetxController {
  final formType =
      ComeFormType.values[int.parse(Get.parameters['formType'] ?? '0')];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onAddAsContact() {}

  void onRemoveFromGroup() {}

  void onSendMessage() {
  }

  void onDeleteChat() {
  }
}
