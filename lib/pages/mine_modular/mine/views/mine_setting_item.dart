

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineSettingItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const MineSettingItem({super.key, required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: Text(title.tr)),
            const Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}