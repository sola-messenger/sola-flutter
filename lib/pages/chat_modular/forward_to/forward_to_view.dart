import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'package:sola/r.dart';
import 'forward_to_controller.dart';
import 'views/forward_select_item.dart';

class ForwardToPage extends GetView<ForwardToController> {
  const ForwardToPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ForwardToController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Forward to'.tr),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    R.assetsIconListMoreIcon,
                    width: 16,
                    height: 4,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: _buildBottomBar(ctl),
            body: _buildViews(),
          );
        });
  }

  Widget _buildViews() => ListView(
        children: [
          const SizedBox(
            height: 11,
          ),
          const SearchBar(),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Joshua Lawrence',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: true,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
          ForwardSelectItem(
              isSelect: false,
              onChangeSelect: () {},
              image: '',
              name: 'Andrew Parker',
              orgName: 'sola'),
        ],
      );

  Widget _buildBottomBar(ForwardToController ctl) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 17,
        ),
        color: const Color(0xFFEAEAEA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ctl.onSelectAll,
              child: const Text(
                'Select All',
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: ctl.onConfirm,
              child: const Text(
                'Confirm ',
                style: TextStyle(
                  fontSize: 16,
                  height: 24 / 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}
