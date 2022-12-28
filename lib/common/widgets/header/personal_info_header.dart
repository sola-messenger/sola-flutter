// Flutter imports:
import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';

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
        left: 13.0,
        right: 4.0,
        bottom: 16,
        top: 11,
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
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
                    fontSize: 15,
                    height: 22 / 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 10,
                    height: 15 / 10,
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
