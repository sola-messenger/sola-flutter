import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/index.dart';

class IndexPageController extends GetxController {
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

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
