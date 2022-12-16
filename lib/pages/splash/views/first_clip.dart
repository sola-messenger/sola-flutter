

import 'package:flutter/material.dart';

class FirstClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 56)
      ..cubicTo(size.width, size.height - 28, size.width / 2, size.height + 45,
          0, size.height - 108)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
