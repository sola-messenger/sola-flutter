// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RadioColumnField extends StatelessWidget {
  final String title;
  final List<String> selectList;
  final String selected;
  final ValueChanged<String?> onSelect;
  final VoidCallback? onShowInfo;

  const RadioColumnField({
    super.key,
    required this.title,
    required this.selectList,
    required this.selected,
    required this.onSelect,
     this.onShowInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title.tr),
            if (onShowInfo != null)
              IconButton(onPressed: onShowInfo, icon: const Icon(Icons.info_outline)),
          ],
        ),
        Wrap(
          children: selectList
              .map((e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(
                          value: e,
                          groupValue: selected,
                          onChanged: (c) {
                            onSelect.call(c);
                          }),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        e,
                      ),
                    ],
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
