import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/extension/stream_extension.dart';
import 'package:sola/common/services/client_service.dart';
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
            body: _buildViews(ctl),
          );
        });
  }

  Widget _buildViews(ForwardToController ctl) => StreamBuilder(
      stream: Get.find<ClientService>()
          .client
          .onSync
          .stream
          .where((event) => event.hasRoomUpdate)
          .rateLimit(const Duration(seconds: 1)),
      builder: (context, _) {
        final List<Room> rooms = Get.find<ClientService>().client.rooms;
        return ListView(
          children: [
            const SizedBox(
              height: 11,
            ),
            const SearchBar(),
            ...rooms
                .map((e) => Obx(
                      () => ForwardSelectItem(
                          isSelect: ctl.selectRooms
                              .where((p0) => p0.id == e.id)
                              .isNotEmpty,
                          onChangeSelect: () {
                            ctl.onSelect(e);
                          },
                          image: e.avatar,
                          name: e.displayname,
                          orgName: 'sola'),
                    ))
                .toList(),
          ],
        );
      });

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
