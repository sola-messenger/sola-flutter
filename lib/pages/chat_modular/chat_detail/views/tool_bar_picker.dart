import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/chat_modular/chat_detail/chat_detail_controller.dart';

class ToolBarPicker extends StatelessWidget {
  final ChatDetailController controller;

  const ToolBarPicker(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: controller.isShowToolBar.value
            ? MediaQuery.of(context).size.height / 3
            : 0,
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 10,
        ),
        child: controller.isShowToolBar.value
            ? Wrap(
                runSpacing: 36,
                children: controller.toolbar
                    .map((e) => InkWell(
                          onTap: e['onTap'],
                          child: SizedBox(
                            width: (Get.mediaQuery.size.width -
                                    Get.mediaQuery.padding.left -
                                    Get.mediaQuery.padding.right) /
                                3,
                            child: Column(
                              children: [
                                Image.asset(
                                  '${e['image']}',
                                  width: 28,
                                  height: 28,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${e['title']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    height: 21 / 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              )
            : null,
      ),
    );
  }
}
