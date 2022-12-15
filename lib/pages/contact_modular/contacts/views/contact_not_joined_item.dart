// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class ContactNotJoinedItem extends StatelessWidget {
  final String inviteCode;
  final VoidCallback? onCopy;

  const ContactNotJoinedItem({
    super.key,
    required this.inviteCode,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Row(
        children: [
          const Text(
            'Not joined',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Invite Code',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    inviteCode,
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          TextButton(onPressed: onCopy, child: const Text('Copy'))
        ],
      ),
    );
  }
}
