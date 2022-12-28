// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';
import 'group_admin_controller.dart';
import 'views/group_admin_item.dart';

class GroupAdminPage extends GetView<GroupAdminController> {
  const GroupAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GroupAdminController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Group Admin'),
              actions: [
                IconButton(
                    onPressed: ctl.onAdd,
                    icon: Image.asset(
                      R.assetsIconAddIcon,
                      width: 14,
                      height: 14,
                      color: AppColors.textBlackColor,
                    ))
              ],
            ),
            body: SafeArea(child: _buildView()),
          );
        });
  }

  Widget _buildView() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(children: [
          GroupAdminItem(
            name: 'Jack Shen',
            onTap: () {},
            onDelete: () {},
            image: '',
          ),
          GroupAdminItem(
            name: 'Alan Zhou',
            onTap: () {},
            onDelete: () {},
            image: '',
          ),
        ]),
      );
}
