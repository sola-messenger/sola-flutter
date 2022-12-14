import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactMemberItem extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  const ContactMemberItem({
    super.key,
    required this.title,
    required this.img,
    this.onTap,
    this.onRemove,
  });

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
            TextButton(onPressed: onRemove, child: const Text('Remove'))
          ],
        ),
      ),
    );
  }
}
