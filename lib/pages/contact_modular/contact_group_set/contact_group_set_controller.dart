// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/index.dart';

class ContactGroupSetController extends GetxController {
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

  void onMoreMembers() {}

  void onLeaveGroup() {}

  void onNavMemberInfo() {
    Get.toNamed(Routers.memberInfoRoute,parameters: {
      'formType':'1',
    });
  }

  void onNavManageGroup() {
    Get.toNamed(Routers.manageGroupRoute);
  }
}
