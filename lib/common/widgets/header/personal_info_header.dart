// Flutter imports:
import 'package:flutter/material.dart';

class PersonalInfoHeader extends StatelessWidget {
  final String image;
  final String name;
  final String desc;

  const PersonalInfoHeader(
      {Key? key, required this.image, required this.name, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4.0,
        right: 4.0,
        top: 23,
        bottom: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            color: Colors.red,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
