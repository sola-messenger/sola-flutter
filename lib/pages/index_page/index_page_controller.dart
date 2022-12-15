// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/widgets/dialog/confirm_dialog.dart';
import 'package:sola/pages/index.dart';

class IndexPageController extends GetxController {

  GlobalKey<ScaffoldState> state = GlobalKey();

  final count = 0.obs;
  List<Map> bottomItems = [
    {
      'icon': Icons.chat,
      'title': 'Chat',
      'page': const ChatPage(),
    },
    {
      'icon': Icons.person_pin_circle,
      'title': 'Contacts',
      'page': const ContactsPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': const MinePage(),
    },
  ];
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
  }


  /// 打开抽屉
  void openDrawer() {
    state.currentState?.openDrawer();
  }

  /// 关闭抽屉
  void closeDrawer() {
    state.currentState?.closeDrawer();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onNavManagerOrg() {
    Get.toNamed(Routers.orgDetailRoute);
  }

  void onChangeOrg() {
    Get.dialog(ConfirmDialog(
        title: 'Are you sure you want to switch organization?',
        content: 'Will log out of the current organization',
        onCancel: () {},
        onConfirm: () {}));
  }

  void onNavCreateOrg() {
    Get.toNamed(Routers.orgCreateRoute);
  }
}
