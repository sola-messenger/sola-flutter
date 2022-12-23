// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/page_view_listener_widget.dart';

class SplashDotPageWidget extends StatelessWidget {
  final PageController controller;
  final int count;

  const SplashDotPageWidget(
      {Key? key, required this.controller, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageViewListenerWidget(
        controller: controller,
        builder: (int currentIndex) => SplashDotWidget(
              count: count,
              index: currentIndex,
            ));
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
