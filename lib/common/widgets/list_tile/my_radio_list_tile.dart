import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRadioListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isSelect;

  const MyRadioListTile(
      {Key? key, this.onTap, required this.title, required this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Row(
          children: [
            Text(
              title.tr,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            CupertinoSwitch(value: isSelect, onChanged: (_) {})
          ],
        ),
      ),
    );
  }
}
