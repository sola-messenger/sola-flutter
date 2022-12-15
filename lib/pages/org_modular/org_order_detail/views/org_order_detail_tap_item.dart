// Flutter imports:
import 'package:flutter/material.dart';

class OrgOrderDetailTapItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String image;

  const OrgOrderDetailTapItem(
      {Key? key, required this.title, required this.onTap, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            color: Colors.black,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(title),
        ],
      ),
    );
  }
}
