// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final String? title;

  const SearchBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 6,
        bottom: 4,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(
            width: 8,
          ),
          Text(
            title ?? 'Search'.tr,
            style: const TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
