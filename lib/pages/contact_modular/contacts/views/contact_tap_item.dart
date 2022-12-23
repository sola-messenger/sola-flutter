// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
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
            left: 12,
            right: 12,
            top: 7,
            bottom: 7,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFEAEAEA),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 16,
                height: 18,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                title.tr,
                style: const TextStyle(
                  fontSize: 14,
                  height: 22 / 14,
                ),
              ),
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
