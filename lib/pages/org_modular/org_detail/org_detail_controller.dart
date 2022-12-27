// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/bottom_sheet/invite_bottom_sheet.dart';
import 'package:sola/pages/org_modular/org_detail/org_detail_view.dart';

class OrgDetailController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    onInviteFriend();
  }

  void onInviteFriend() {
    DialogUtils.showBottomSheet(child: InviteBottomSheet(onInviteNow: () {
      Get.back();
    }));
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onSearch() {}

  void onUpgrade() {}

  void onNavManageInfo() {
    Get.toNamed(Routers.orgManagerRoute);
  }

  void onInviteMembers() {
    Get.toNamed(Routers.orgConfirmOrderRoute);
  }

  void onExitOrg() {}
}
