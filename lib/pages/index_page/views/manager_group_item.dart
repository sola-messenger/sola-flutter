
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerGroupItem extends StatelessWidget {
  final VoidCallback onTap;

  const ManagerGroupItem({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            const SizedBox(
              width: 16,
            ),
            Text('Mange Organization'.tr),
          ],
        ),
      ),
    );
  }
}
