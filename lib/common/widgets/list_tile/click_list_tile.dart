import 'package:flutter/material.dart';

class ClickListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? content;

  const ClickListTile({Key? key, this.onTap, required this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  content ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (onTap != null) Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}
