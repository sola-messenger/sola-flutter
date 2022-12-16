

import 'package:flutter/material.dart';
import 'package:sola/r.dart';

class SIconWidget extends StatelessWidget {
  const SIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      alignment: Alignment.center,
      child: Image.asset(R.assetsIconSBlueIcon),
    );
  }
}
