import 'package:flutter/material.dart';
import 'package:sola/r.dart';

class SolaCheckBox2 extends StatelessWidget {
  final bool isSelect;
  final VoidCallback onChange;

  const SolaCheckBox2({Key? key, required this.isSelect, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Image(
        image: AssetImage(
            isSelect ? R.assetsIconCheckBoxSelectIcon : R.assetsIconCheckBoxUnselectIcon),
        width: 18,
        height: 18,
      ),
    );
  }
}
