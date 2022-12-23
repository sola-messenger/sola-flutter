// Flutter imports:
import 'package:flutter/material.dart';

class NewContactItem extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String status;
  final VoidCallback? onTap;

  const NewContactItem(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.status,
       this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 22 / 14,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontSize: 10,
                      height: 22 / 10,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: onTap,
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 18 / 12,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
