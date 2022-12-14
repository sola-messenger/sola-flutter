


import 'package:flutter/material.dart';

class NewContactItem extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String status;
  final VoidCallback onTap;

  const NewContactItem({super.key, required this.image, required this.name, required this.desc, required this.status, required this.onTap});

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
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(desc,style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),),
                ],
              ),
            ),
            TextButton(onPressed: (){}, child: Text(status)),
            ],
        ),
      ),
    );
  }
}