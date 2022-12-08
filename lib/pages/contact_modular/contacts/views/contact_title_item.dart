import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactTitleItem extends StatelessWidget {
  final String title;

  const ContactTitleItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
