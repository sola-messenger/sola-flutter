// Flutter imports:
import 'package:flutter/material.dart';

class GroupAdminItem extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final String image;
  final String name;

  const GroupAdminItem({
    Key? key,
    required this.onTap,
    required this.onDelete,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            width: 16,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: onDelete,
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ))
        ],
      ),
    );
  }
}
