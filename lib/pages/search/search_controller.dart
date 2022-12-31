import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/app_constants.dart';
import 'package:sola/common/services/client_service.dart';

class SearchController extends GetxController {
  TextEditingController controller = TextEditingController();
  SearchUserDirectoryResponse? userSearchResult;
  QueryPublicRoomsResponse? roomSearchResult;
  RxBool isSearching = false.obs;
  Timer? _coolDown;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onSearchEnter(String text) {
    if (text.isEmpty) {
      cancelSearch();
      return;
    }
    _coolDown?.cancel();
    _coolDown = Timer(const Duration(milliseconds: 500), _search);
  }

  void _search() async {
    final client = Get.find<ClientService>().client;
    if (isSearching.isFalse) {
      isSearching.call(true);
      isSearching.refresh();
    }

    SearchUserDirectoryResponse? userSearchResult;
    QueryPublicRoomsResponse? roomSearchResult;
    try {
      roomSearchResult = await client.queryPublicRooms(
        server: AppConstants.homeService,
        filter: PublicRoomQueryFilter(genericSearchTerm: controller.text),
        limit: 20,
      );
      userSearchResult = await client.searchUserDirectory(
        controller.text,
        limit: 20,
      );
    } catch (e, s) {
      Logs().w('Searching has crashed', e, s);
    }
    isSearching.call(false);
    isSearching.refresh();
    this.roomSearchResult = roomSearchResult;
    this.userSearchResult = userSearchResult;
  }

  void cancelSearch() {
    controller.clear();
    roomSearchResult = userSearchResult = null;
    isSearching.call(false);
  }
}
