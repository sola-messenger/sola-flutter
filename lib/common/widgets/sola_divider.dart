import 'package:flutter/material.dart';

class SolaDivider extends StatelessWidget {
  const SolaDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0x4A3C3C43),
      height: 0.33,
    );
  }
}
