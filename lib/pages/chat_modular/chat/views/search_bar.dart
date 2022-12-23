// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';

class SearchBar extends StatelessWidget {
  final String? title;

  const SearchBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 6,
        bottom: 4,
      ),
      padding: const EdgeInsets.only(
        left: 9,
        right: 8,
        top: 6,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        children: [
          Image.asset(
            R.assetsIconSearchIcon,
            width: 15,
            height: 15,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title ?? 'Search'.tr,
            style: const TextStyle(
              color: AppColors.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
