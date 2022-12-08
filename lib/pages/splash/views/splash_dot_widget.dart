
import 'package:flutter/material.dart';

class SplashDotWidget extends StatelessWidget {
  final int count;
  final int index;

  const SplashDotWidget({super.key, required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) => Container(
          width: this.index == index? 30:15,
          height: 15,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: this.index== index? BoxShape.rectangle:BoxShape.circle,
            color: this.index == index? Colors.black:Colors.grey,
            borderRadius:  this.index == index?BorderRadius.circular(16):null,
          ),
        )),
      ),
    );
  }
}
