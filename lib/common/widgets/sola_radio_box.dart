import 'package:flutter/material.dart';
import 'package:sola/r.dart';

class SolaRadioBox extends StatelessWidget {
  final bool isSelect;
  final VoidCallback onChange;

  const SolaRadioBox({Key? key, required this.isSelect, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Image(
        image: AssetImage(isSelect
            ? R.assetsIconRadioSelectIcon
            : R.assetsIconRadioUnselectIcon),
        width: 15,
        height: 15,
      ),
    );
  }
}
