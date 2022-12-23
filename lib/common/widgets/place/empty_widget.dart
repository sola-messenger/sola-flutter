import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';

class EmptyWidget extends StatelessWidget {
  final String title;

  const EmptyWidget({Key? key,  this.title = 'Whoops, no results'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(
        top: 53,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            R.assetsIconEmptyPlaceHold,
            width: 224,
            height: 183,
          ),
          const SizedBox(
            height: 23,
          ),
          Text(title,style: const TextStyle(
            color: AppColors.textBlackColor,
            fontSize: 16,
            height: 24/16,
          ),)
        ],
      ),
    );
  }
}
