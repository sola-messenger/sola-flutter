import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'package:sola/pages/chat_modular/select_members/views/select_member_item.dart';
import 'select_members_controller.dart';

class SelectMembersPage extends GetView<SelectMembersController> {
  const SelectMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SelectMembersController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Create Group'.tr),
            ),
            bottomNavigationBar: buildBottomBar(),
            body: SafeArea(child: _buildViews()),
          );
        });
  }

  Widget buildBottomBar() => Container(
        height: 44,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Select All'.tr,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Confirm'.tr,
              ),
            ),
          ],
        ),
      );

  Widget _buildViews() => Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    'Selected 13 contacts',
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 60,
                  child: Scrollbar(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: _buildSelectMembers),
                  ),
                ),
                const SearchBar(),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: [
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Mary',
                      orgName: 'DCS Card',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: true,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                  SelectMemberItem(
                      image: 'image',
                      name: 'Alic',
                      orgName: 'Hydefi',
                      isSelect: false,
                      onSelect: () {}),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildSelectMembers(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
