import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:sola/common/index.dart';
import 'package:sola/r.dart';

class AllImagesController extends GetxController {
  bool isSingleSelect = Get.parameters['model'] == 'single';

  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxInt page = 0.obs;
  RxInt pageSize = 100.obs;
  Rx<AssetPathEntity?> currentSelectPath = (null as AssetPathEntity?).obs;
  RxBool isShowError = false.obs;
  RxList<AssetPathEntity> groupList = <AssetPathEntity>[].obs;
  RxInt groupIndex = 0.obs;

  RxList<AssetEntity> currentSelectList = <AssetEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    _onRequestPermission();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void _onRequestPermission() async {
    final result = await PhotoManager.requestPermissionExtend();
    if (result == PermissionState.authorized) {
      groupList.value = await PhotoManager.getAssetPathList(
        onlyAll: true,
        type: RequestType.image,
      );
      currentSelectPath.call(groupList[groupIndex.value]);
      imageList.call(await currentSelectPath.value!
          .getAssetListPaged(page: page.value, size: pageSize.value));
      update();
    } else {
      isShowError.call(true);
      update();
    }
  }

  void onCancel() {
    Get.back();
  }

  void onSend() {
    Get.back(result: currentSelectList.value);
  }

  void onSelectAll() {
    if (currentSelectList.length == imageList.length) {
      currentSelectList.clear();
    } else {
      currentSelectList.addAll(imageList.value);
    }
    currentSelectList.refresh();
  }

  void onSelectOne(AssetEntity image) async{
    if (isSingleSelect) {
      currentSelectList.clear();
      final file = await image.originFile;

      Get.toNamed(Routers.cropImageRoute, parameters: {
        'imagePath': file!.path,
      });
    } else {
      if (currentSelectList.where((p0) => p0.id == image.id).isNotEmpty) {
        currentSelectList.removeWhere((element) => element.id == image.id);
      } else {
        currentSelectList.add(image);
      }
      currentSelectList.refresh();
    }
  }

  void onShowAllGallery() {
    Get.dialog(
        Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: AppBar().preferredSize.height +
                        Get.mediaQuery.padding.top,
                  ),
                  color: const Color(0xD65D5D5D),
                  height: Get.mediaQuery.size.height -
                      AppBar().preferredSize.height -
                      Get.mediaQuery.padding.top,
                  width: Get.mediaQuery.size.width,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: AppBar().preferredSize.height +
                      Get.mediaQuery.padding.top,
                ),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(groupList.value.length, (index) {
                    final e = groupList[index];
                    return Row(
                      children: [
                        FutureBuilder(
                          future: () async {
                            final data =
                                await e.getAssetListPaged(page: 0, size: 1);
                            return await data.first.file;
                          }(),
                          builder: (BuildContext context,
                              AsyncSnapshot<File?> snapshot) {
                            return snapshot.hasData
                                ? ExtendedImage.file(
                                    snapshot.data!,
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                  );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            '${e.name}(${e.assetCount})',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              height: 22 / 15,
                            ),
                          ),
                        ),
                        groupIndex.value == index
                            ? Image.asset(
                                R.assetsIconDoneIcon,
                                width: 17,
                                height: 12,
                              )
                            : Container(),
                        const SizedBox(
                          width: 9,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        barrierColor: Colors.transparent,
        useSafeArea: false);
  }
}
