import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PreodRadioColumnField extends StatelessWidget {
  final String title;
  final ValueChanged<int> onSelect;
  final int? selected;
  final List<int> perodList;

  const PreodRadioColumnField({
    super.key,
    required this.title,
    required this.onSelect,
    required this.selected,
    required this.perodList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.tr),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(perodList.length, (index) => _buildItem(context, index)),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = perodList[index];
    bool isSelect = item==selected;
    return SizedBox(
      width: Get.mediaQuery.size.width/4 - 18,
      child: InkWell(
        onTap: () {
          onSelect.call(item);
        },
        borderRadius: BorderRadius.circular(32),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelect ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.blue ,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          child: Center(
            child: Text('$item Months',style: TextStyle(
              color: isSelect?Colors.white:Colors.blue,
            ),),
          ),
        ),
      ),
    );
  }
}
