import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';
import 'call_page_controller.dart';

class CallPagePage extends GetView<CallPageController> {
  const CallPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CallPageController(),
        builder: (ctl) {
          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text('Group Call'.tr),
              actions: [
                IconButton(
                  onPressed: ctl.onAddCall,
                  icon: Image.asset(
                    R.assetsIconAddGreyIcon,
                    width: 14,
                    height: 14,
                  ),
                ),
              ],
            ),
            body: _buildViews(ctl),
          );
        });
  }

  Widget _buildViews(CallPageController ctl) => Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 37.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ctl.toolbar
                    .map((e) => Container(
                          width: 47,
                          height: 47,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            e['image'],
                            width: 28,
                            height: 22,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 36.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 77,
                    height: 77,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Container(
                    width: 77,
                    height: 77,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Container(
                    width: 77,
                    height: 77,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
