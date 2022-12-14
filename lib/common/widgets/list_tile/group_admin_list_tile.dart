import 'package:flutter/material.dart';
import 'dart:math' as math;

class GroupAdminListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final List<String> avatars;

  const GroupAdminListTile(
      {Key? key,
      this.onTap,
      required this.title,
      required this.avatars})
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
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  math.min(avatars.length, 2),
                  (index) => Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3,
                    ),
                  ),
                ),
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                  )),
              margin: const EdgeInsets.symmetric(
                horizontal: 3,
              ),
              alignment: Alignment.center,
              child: const Text(
                '+',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Total ${avatars.length}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (onTap != null) const Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}
