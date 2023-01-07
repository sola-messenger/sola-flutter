import 'package:flutter/material.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/sola_check_box2.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';

class ForwardSelectItem extends StatelessWidget {
  final bool isSelect;
  final VoidCallback onChangeSelect;
  final Uri? image;
  final String name;
  final String orgName;

  const ForwardSelectItem(
      {Key? key,
      required this.isSelect,
      required this.onChangeSelect,
      required this.image,
      required this.name,
      required this.orgName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChangeSelect,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          children: [
            IgnorePointer(
              child:
                  SolaCheckBox2(isSelect: isSelect, onChange: onChangeSelect),
            ),
            const SizedBox(
              width: 14,
            ),
            Avatar(
              size: 40,
              mxContent: image,
              name: name,
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Color(0x4A3C3C43),
                  width: 0.33,
                ))),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 22 / 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      orgName,
                      style: const TextStyle(
                        color: AppColors.mainBlueColor,
                        fontSize: 13,
                        height: 18 / 13,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
