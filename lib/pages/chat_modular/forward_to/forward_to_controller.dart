import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix/src/room.dart';
import 'package:sola/common/services/client_service.dart';

class ForwardToController extends GetxController {
  final count = 0.obs;
  RxList<Room> selectRooms = <Room>[].obs;

  Map<String, dynamic> forwardToEvent = Get.arguments['events'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onSelectAll() {
    final allRooms = Get.find<ClientService>().client.rooms;
    if (selectRooms.length == allRooms.length) {
      selectRooms.clear();
    } else {
      selectRooms.assignAll(allRooms);
    }
    selectRooms.refresh();
  }

  void onConfirm() async {
    for (final room in selectRooms) {
      // room.sendEvent(content);
      final shareFile = forwardToEvent.tryGet<MatrixFile>('file');
      if (forwardToEvent.tryGet<String>('msgtype') ==
              'chat.fluffy.shared_file' &&
          shareFile != null) {
        // await showDialog(
        //   context: Get.overlayContext!,
        //   useRootNavigator: false,
        //   builder: (c) => SendFileDialog(
        //     files: [shareFile],
        //     room: room,
        //   ),
        // );
      } else {
        room.sendEvent(forwardToEvent);
      }
    }
    Get.back();
  }

  void onSelect(Room e) {
    if (selectRooms.where((p0) => p0.id == e.id).isNotEmpty) {
      selectRooms.removeWhere((element) => element.id == e.id);
    } else {
      selectRooms.add(e);
    }
    selectRooms.refresh();
  }
}
