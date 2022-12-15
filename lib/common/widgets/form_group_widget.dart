// Flutter imports:
import 'package:flutter/material.dart';

class FormGroupWidget extends StatelessWidget {
  final List<Widget> children;
  final bool addDivider;
  final bool noAddLastDivider;

  const FormGroupWidget(
      {super.key,
      required this.children,
      this.addDivider = true,
      this.noAddLastDivider = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            children.length,
            (index) => Container(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 8,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                      border: !addDivider ||
                              (index == children.length - 1 && noAddLastDivider)
                          ? null
                          : const Border(
                              bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ))),
                  child: children[index],
                )),
      ),
    );
  }
}
