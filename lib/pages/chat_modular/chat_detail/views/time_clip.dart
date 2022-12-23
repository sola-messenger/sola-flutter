// Flutter imports:
import 'package:flutter/material.dart';

class TimeClip extends StatelessWidget {
  final String time;

  const TimeClip({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 11,
        bottom: 8,
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: const TextStyle(
          fontSize: 10,
          height: 15 / 10,
          color: Color(0xFF6E8597),
        ),
      ),
    );
  }
}
