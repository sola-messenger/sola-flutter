// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class OrganizationMembers {
  final int? id;

  final int? allowMemberNum;
  final String? price;
  final String? discountPrice;
  OrganizationMembers(
      this.id, this.allowMemberNum, this.price, this.discountPrice);
}

class PriceRadioColumnField extends StatelessWidget {
  final String title;
  final ValueChanged<OrganizationMembers> onSelect;
  final OrganizationMembers? selected;
  final List<OrganizationMembers> memberList;

  const PriceRadioColumnField({
    super.key,
    required this.title,
    required this.onSelect,
    required this.selected,
    required this.memberList,
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
        SizedBox(
            height: 85,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: _buildItem,
              itemCount: memberList.length,
              scrollDirection: Axis.horizontal,
            )),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = memberList[index];
    bool isSelect = item.id == selected?.id;
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
      ),
      child: InkWell(
        onTap: () {
          onSelect.call(item);
        },
        child: Ink(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: isSelect ? Colors.pink : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(),
          ),
          padding: const EdgeInsets.only(
            top: 6,
          ),
          child: Column(
            children: [
              Text(
                '${item.allowMemberNum} Members',
                style: TextStyle(
                  color: isSelect ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (item.discountPrice != null)
                Text(
                  '\$ ${item.discountPrice}/Month',
                  style: TextStyle(
                    color: isSelect ? Colors.white : Colors.black,
                  ),
                ),
              Text(
                '\$ ${item.price}/Month',
                style: TextStyle(
                  decoration: item.discountPrice != null
                      ? TextDecoration.lineThrough
                      : null,
                  color: isSelect ? Colors.white : item.discountPrice != null?Colors.grey:Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
