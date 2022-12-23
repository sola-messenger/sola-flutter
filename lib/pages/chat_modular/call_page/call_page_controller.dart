import 'package:get/get.dart';
import 'package:sola/r.dart';

class CallPageController extends GetxController {
  final count = 0.obs;

  List get toolbar => [
        {'image': R.assetsIconNotifactionIcon, 'onTap': onNotification},
        {'image': R.assetsIconVoiceIcon2, 'onTap': onVoice},
        {'image': R.assetsIconHandUpIcon, 'onTap': onHandUp}
      ];

  void onNotification() {}

  void onVoice() {}

  void onHandUp() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onAddCall() {}
}
