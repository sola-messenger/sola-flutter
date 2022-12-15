// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class CreateGroupItem extends StatelessWidget {
  final VoidCallback onTap;

  const CreateGroupItem({Key? key, required this.onTap}) : super(key: key);

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
            Text('Create Organization'.tr),
          ],
        ),
      ),
    );
  }
}
