// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';

class MineController extends GetxController {
  MineController();

  _initData() {
    update(["mine"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void onNavQRCode() {
    Get.toNamed(Routers.myQrcodeRoute);
  }

  void onNavOrganzation() {
    Get.toNamed(Routers.orgDetailRoute);
  }

  void onNavVersion() {
    Get.toNamed(Routers.versionInfoRoute);
  }

  void onNavAboutUs() {
    Get.toNamed(Routers.aboutUsRoute);
  }

  void onNavChangePassword() {
    Get.toNamed(Routers.changePasswordRoute);
  }

  void onNavSettings() {
    Get.toNamed(Routers.settingsRoute);
  }

  void onLogout() async {
    final client = Get.find<ClientService>().client;
    client.logout();
    Get.offAllNamed(Routers.splashRoute);
  }

  void onNavPersonalInfo() {
    Get.toNamed(Routers.personalInfoRoute);
  }

  void onScanQrCode() {}
}
