import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/services/client_service.dart';

class RoomUpdateWidget extends StatelessWidget {
  final WidgetBuilder builder;

  const RoomUpdateWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Get.find<ClientService>()
          .client
          .onSync
          .stream
          .where((syncUpdate) => syncUpdate.hasRoomUpdate),
      builder: (context, snapshot) => builder(context),
    );
  }
}
