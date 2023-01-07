import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';
import 'package:sola/r.dart';

class MemberListWrap extends StatelessWidget {
  final List<User> members;
  final ValueChanged<User> onMemberDetail;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const MemberListWrap(
      {Key? key,
      required this.members,
      required this.onMemberDetail,
      required this.onAdd,
      required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        alignment: WrapAlignment.start,
        children: List.generate(
          members.length,
          (index) => InkWell(
            onTap: () {
              onMemberDetail(members[index]);
            },
            child: Avatar(
              size: (Get.mediaQuery.size.width - 26 - 15 * 5) / 6,
              mxContent: members[index].avatarUrl,
              name: members[index].displayName,
            ),
          ),
        )..addAll([
            InkWell(
              onTap: onAdd,
              borderRadius: BorderRadius.circular(99),
              child: Ink(
                width: (Get.mediaQuery.size.width - 26 - 15 * 5) / 6,
                height: (Get.mediaQuery.size.width - 26 - 15 * 5) / 6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.mainBlueColor,
                      width: 1,
                    )),
                child: Center(
                  child: Image.asset(
                    R.assetsIconAddIcon,
                    width: 19,
                    height: 19,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onRemove,
              borderRadius: BorderRadius.circular(99),
              child: Ink(
                width: (Get.mediaQuery.size.width - 26 - 15 * 5) / 6,
                height: (Get.mediaQuery.size.width - 26 - 15 * 5) / 6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.mainBlueColor,
                      width: 1,
                    )),
                child: Center(
                  child: Image.asset(
                    R.assetsIconRemoveIcon,
                    width: 19,
                    height: 19,
                  ),
                ),
              ),
            ),
          ]),
      ),
    );
  }
}
