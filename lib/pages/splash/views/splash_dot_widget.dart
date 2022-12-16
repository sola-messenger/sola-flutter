// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';

class SplashDotPageWidget extends StatelessWidget {
  final PageController controller;
  final int count;

  const SplashDotPageWidget(
      {Key? key, required this.controller, required this.count})
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

    return SplashDotWidget(
      count: count,
      index: currentIndex,
    );
  }
}

class SplashDotWidget extends StatelessWidget {
  final int count;
  final int index;

  const SplashDotWidget({super.key, required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            count,
            (index) => Container(
                  width: 8.5,
                  height: 8.5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: this.index == index
                        ? AppColors.mainBlueColor
                        : const Color(0xFFBCD1FC),
                  ),
                )),
      ),
    );
  }
}
