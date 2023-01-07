import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/pages/chat_modular/chat_detail/chat_detail_controller.dart';

class TypingIndicators extends StatelessWidget {
  final ChatDetailController controller;

  const TypingIndicators(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.room.value == null || controller.timeline == null) {
      return Container();
    }
    final typingUsers = controller.room.value!.typingUsers
      ..removeWhere(
          (u) => u.stateKey == Get.find<ClientService>().client.userID);
    return Visibility(
      visible: typingUsers.isNotEmpty,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: AnimatedContainer(
          constraints: const BoxConstraints(maxWidth: 250),
          height: 38,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.only(
            bottom: 6,
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          child: Text(
            '${typingUsers.map((e) => e.displayName).join(',')} is typing......',
            style: const TextStyle(
              color: AppColors.greyColor,
              fontSize: 10,
              height: 15 / 10,
            ),
          ),
        ),
      ),
    );
  }
}
