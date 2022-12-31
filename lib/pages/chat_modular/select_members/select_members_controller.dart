// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';

class SelectMembersController extends GetxController {
  RxList<Profile> members = <Profile>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Get.find<ClientService>()
    //     .client
    //     .rooms
    //     .where((element) => element.membership == Membership.join)
    //     .toList();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
