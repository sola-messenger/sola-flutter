import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';
import 'search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SearchController(),
        builder: (ctl) {
          return Scaffold(
            body: _buildViews(ctl),
          );
        });
  }

  _buildViews(SearchController ctl) => DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(
              height: Get.mediaQuery.padding.top + 5,
            ),
            _buildSearchInput(ctl),
            TabBar(
              tabs: [
                'Chat',
                'Media',
                'Files',
                'Links',
                'Music',
              ]
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList(),
              indicatorColor: AppColors.mainBlueColor,
              unselectedLabelColor: AppColors.greyColor,
              labelColor: AppColors.mainBlueColor,
              labelStyle: const TextStyle(
                fontSize: 12,
                height: 18 / 12,
              ),
            ),
            Expanded(
              child: Obx(
                () => ctl.isSearching.isTrue
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : TabBarView(
                        children: [
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      );

  Row _buildSearchInput(SearchController ctl) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.keyboard_arrow_left_outlined)),
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: TextField(
                  controller: ctl.controller,
                  onChanged: ctl.onSearchEnter,
                  decoration: const InputDecoration(
                    fillColor: Color(0xFFEAEAEA),
                    filled: true,
                    isDense: true,
                    isCollapsed: true,
                    constraints: BoxConstraints(
                      maxHeight: 25,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 7.0, top: 3.0),
                  child: AnimatedBuilder(
                    animation: ctl.controller,
                    builder: (BuildContext context, Widget? child) {
                      return Visibility(
                        visible: ctl.controller.text.isNotEmpty,
                        child: GestureDetector(
                          onTap: () {
                            ctl.controller.clear();
                          },
                          child: Image.asset(
                            R.assetsIconDeleteGreyIcon,
                            width: 12,
                            height: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 13,
        ),
      ],
    );
  }
}
