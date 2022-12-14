import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'group_admin_controller.dart';
import 'views/group_admin_item.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

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
            ),
            body: SafeArea(child: _buildView()),
          );
        });
  }

  Widget _buildView() => Padding(
    padding: const EdgeInsets.only(
        top: 8.0),
    child: FormGroupWidget(addDivider: false, children: [
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
          const Center(
            child: SizedBox(
              height: 43,
            ),
          ),
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: RDottedLineBorder.all(
                  color: Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                '+',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ]),
  );
}
