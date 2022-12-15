// Flutter imports:
import 'package:flutter/material.dart';

class GroupSwitchItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final bool isSelect;

  const GroupSwitchItem(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      this.isSelect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: isSelect ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelect ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
              ),
              if (isSelect) const Icon(Icons.select_all),
            ],
          ),
        ),
      ),
    );
  }
}
