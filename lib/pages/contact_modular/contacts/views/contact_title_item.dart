import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';

class ContactTitleItem extends StatelessWidget {
  final String title;
  final Widget? action;

  const ContactTitleItem({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      color: Colors.grey.withOpacity(0.5),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
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
