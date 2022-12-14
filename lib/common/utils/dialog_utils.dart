import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<void> showDialog({required Widget child}) async {
    return await Get.dialog(
        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
            ),
            child,
          ],
        ),
        barrierColor: const Color(0xFFD9D9D9).withOpacity(0.31));
  }

  static Future<void> showBottomSheet({required Widget child}) async {
    return await Get.bottomSheet(
        Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(bottom: 0, left: 0, right: 0, child: child),
          ],
        ),
        barrierColor: const Color(0xFFD9D9D9).withOpacity(0.31));
  }
}
