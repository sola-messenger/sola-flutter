// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class ContactGroupItem extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? onTap;
  final String createdBy;

  const ContactGroupItem(
      {super.key,
      required this.title,
      required this.img,
      this.onTap,
      required this.createdBy});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Create by'.tr,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  createdBy,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
