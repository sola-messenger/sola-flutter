// Flutter imports:
import 'package:flutter/material.dart';

class SystemMsgClip extends StatelessWidget {
  final String time;

  const SystemMsgClip({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 6,
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: const TextStyle(
          fontSize: 10,
          height: 15 / 10,
          color: Color(0xFF7B7B7B),
        ),
      ),
    );
  }
}
