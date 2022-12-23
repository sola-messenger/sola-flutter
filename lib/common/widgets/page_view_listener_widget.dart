import 'package:flutter/material.dart';

class PageViewListenerWidget extends StatelessWidget {
  final PageController controller;
  final Widget Function(int currentIndex) builder;

  const PageViewListenerWidget(
      {Key? key, required this.controller, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimatedItem);
  }

  Widget _buildAnimatedItem(BuildContext context, Widget? child) {
    //当前页数
    int currentIndex;
    //偏移量
    double offset = 0;

    //如果获取不了，则使用初始化的值,一般第一次渲染的时候无法获取到
    if (!controller.hasClients ||
        controller.positions.length != 1 ||
        controller.page == null) {
      currentIndex = controller.initialPage;
      offset = controller.initialPage.toDouble();
    } else {
      currentIndex = controller.page! ~/ 1;
      offset = controller.page!;
    }
    if (offset - currentIndex > 0.5) {
      currentIndex += 1;
    }
    return builder.call(currentIndex);
  }
}
