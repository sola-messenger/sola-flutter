


import 'package:flutter/material.dart';

class TimeClip extends StatelessWidget {
  final String time;
  const TimeClip({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      alignment: Alignment.center,
      child: Text(time),
    );
  }
}