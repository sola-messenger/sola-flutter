import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactTapItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool hasNews;

  const ContactTapItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.hasNews = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                color: Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title.tr),
              const SizedBox(
                width: 8,
              ),
              if (hasNews)
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
