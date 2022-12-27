// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:geolocator/geolocator.dart';

class ContactTitleItem extends StatelessWidget {
  final String title;
  final Widget? action;

  const ContactTitleItem({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          height: 22 / 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    if (action != null) {
      child = Stack(
        children: [
          child,
          Positioned(
            right: 16,
            top: 8,
            bottom: 0,
            child: action!,
          )
        ],
      );
    }
    return child;
  }
}
