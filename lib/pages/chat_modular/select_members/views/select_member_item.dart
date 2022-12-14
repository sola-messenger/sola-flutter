import 'package:flutter/material.dart';

class SelectMemberItem extends StatelessWidget {
  final String image;
  final String name;
  final String orgName;
  final bool isSelect;
  final VoidCallback onSelect;

  const SelectMemberItem(
      {super.key,
      required this.image,
      required this.name,
      required this.orgName,
      required this.isSelect,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Row(
          children: [
            Checkbox(value: isSelect, onChanged: (value) {}),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: Ink(
                  padding: const EdgeInsets.only(bottom: 4),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ))),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$orgName',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
