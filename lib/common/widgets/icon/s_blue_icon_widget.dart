import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';

class SBlueIconWidget extends StatelessWidget {
  const SBlueIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: AppColors.mainBlueColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      alignment: Alignment.center,
      child: Image.asset(R.assetsIconSIcon),
    );
  }
}
