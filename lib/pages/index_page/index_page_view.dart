// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/page_view_listener_widget.dart';

// Project imports:
import 'package:sola/pages/index_page/views/create_group_item.dart';
import 'package:sola/pages/index_page/views/manager_group_item.dart';
import 'index_page_controller.dart';
import 'views/group_switch_item.dart';

class IndexPagePage extends GetView<IndexPageController> {
  const IndexPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: IndexPageController(),
        builder: (ctl) {
          return Scaffold(
            key: ctl.state,
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
            drawer: Drawer(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        width: 30,
                        height: 40,
                      ),
                      Positioned(
                          top: 15,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'My Organization'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Positioned(
                        top: 0,
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            ctl.closeDrawer();
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GroupSwitchItem(
                    title: 'Central China Normal University',
                    image: '',
                    onTap: ctl.onChangeOrg,
                    isSelect: true,
                  ),
                  GroupSwitchItem(
                    title: '上海大莱信息技术有限公司',
                    image: '',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ManagerGroupItem(
                    onTap: ctl.onNavManagerOrg,
                  ),
                  CreateGroupItem(
                    onTap: ctl.onNavCreateOrg,
                  ),
                ],
              ),
            ),
          );
        });
  }

  _buildBottomBar(IndexPageController ctl) => Container(
        decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
            width: 0.5,
            color: Color(0xFFEAEAEA),
          )),
        ),
        padding: EdgeInsets.only(
          bottom: Get.mediaQuery.padding.bottom,
        ),
        child: PageViewListenerWidget(
            controller: ctl.pageController,
            builder: (int currentIndex) => Row(
                  children: List.generate(ctl.bottomItems.length, (index) {
                    return Expanded(
                        child: InkWell(
                      onTap: () {
                        ctl.pageController.jumpToPage(index);
                      },
                      child: Ink(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 10,
                        ),
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
                                elevation: 0,
                                shape: BadgeShape.square,
                                showBadge: index == 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  ctl.bottomItems[index]['icon'],
                                  width: 20,
                                  height: 20,
                                  color: currentIndex == index
                                      ? AppColors.mainBlueColor
                                      : AppColors.greyColor,
                                )),
                            const SizedBox(
                              height: 4.5,
                            ),
                            Text(
                              '${ctl.bottomItems[index]['title']}',
                              style: AppTextStyles.blue_10.copyWith(
                                fontWeight: currentIndex == index
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: currentIndex == index
                                    ? AppColors.mainBlueColor
                                    : AppColors.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  }),
                )),
      );

  Widget _buildItems(IndexPageController ctl, BuildContext context, int index) {
    return ctl.bottomItems[index]['page'] as Widget;
  }
}
