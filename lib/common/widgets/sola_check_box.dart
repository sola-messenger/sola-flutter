import 'package:flutter/material.dart';
import 'package:sola/r.dart';

class SolaCheckBox extends StatelessWidget {
  final bool isSelect;
  final VoidCallback onChange;

  const SolaCheckBox({Key? key, required this.isSelect, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Image(
        image: AssetImage(
            isSelect ? R.assetsIconCheckboxInput : R.assetsIconCheckboxUninput),
        width: 15,
        height: 15,
      ),
    );
  }
}
