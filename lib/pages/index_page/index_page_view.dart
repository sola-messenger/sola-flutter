import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index_page_controller.dart';

class IndexPagePage extends GetView<IndexPageController> {
  const IndexPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: IndexPageController(),
        builder: (ctl) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  controller: ctl.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      _buildItems(ctl, context, index),
                  itemCount: ctl.bottomItems.length,
                )),
                _buildBottomBar(ctl),
              ],
            ),
          );
        });
  }

  _buildBottomBar(IndexPageController ctl) => BottomAppBar(
        child: Row(
          children: List.generate(ctl.bottomItems.length, (index) {
            return Expanded(
                child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                ctl.pageController.jumpToPage(index);
              },
              child: Ink(
                color: Colors.white,
                child: Column(
                  children: [
                    Badge(
                        badgeContent: const Text(
                          '99+',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                        shape: BadgeShape.square,
                        showBadge: index == 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        child: Icon(ctl.bottomItems[index]['icon'])),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('${ctl.bottomItems[index]['title']}'),
                  ],
                ),
              ),
            ));
          }),
        ),
      );

  Widget _buildItems(IndexPageController ctl, BuildContext context, int index) {
    return ctl.bottomItems[index]['page'] as Widget;
  }
}
