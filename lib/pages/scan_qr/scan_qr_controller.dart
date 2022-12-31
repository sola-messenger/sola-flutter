import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sola/common/app_constants.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:collection/collection.dart';

class ScanQrController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onQRViewCreated(QRViewController p1) {
    this.controller = p1;
    // Workaround for QR Scanner is started in Pause mode
    // https://github.com/juliuscanute/qr_code_scanner/issues/538#issuecomment-1133883828
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
    late StreamSubscription sub;
    sub = controller!.scannedDataStream.listen((scanData) {
      sub.cancel();
      Get.back();
      openMatrixToUrl(scanData.code);
    });
  }

  void openMatrixToUrl(String? code) async {
    final matrix = Get.find<ClientService>().client;
    final url = code!.replaceFirst(
      AppConstants.deepLinkPrefix,
      AppConstants.inviteLinkPrefix,
    );
    // The identifier might be a matrix.to url and needs escaping. Or, it might have multiple
    // identifiers (room id & event id), or it might also have a query part.
    // All this needs parsing.
    final identityParts = url.parseIdentifierIntoParts() ??
        Uri.tryParse(url)?.host.parseIdentifierIntoParts() ??
        Uri.tryParse(url)
            ?.pathSegments
            .lastWhereOrNull((_) => true)
            ?.parseIdentifierIntoParts();
    if (identityParts == null) {
      return; // no match, nothing to do
    }
    if (identityParts.primaryIdentifier.sigil == '#' ||
        identityParts.primaryIdentifier.sigil == '!') {
      // we got a room! Let's open that one
      final roomIdOrAlias = identityParts.primaryIdentifier;
      final event = identityParts.secondaryIdentifier;
      var room = matrix.getRoomByAlias(roomIdOrAlias) ??
          matrix.getRoomById(roomIdOrAlias);
      var roomId = room?.id;
      // we make the servers a set and later on convert to a list, so that we can easily
      // deduplicate servers added via alias lookup and query parameter
      final servers = <String>{};
      if (room == null && roomIdOrAlias.sigil == '#') {
        // we were unable to find the room locally...so resolve it
        final response = await showFutureLoadingDialog(
          context: Get.overlayContext!,
          future: () => matrix.getRoomIdByAlias(roomIdOrAlias),
        );
        if (response.error != null) {
          return; // nothing to do, the alias doesn't exist
        }
        roomId = response.result!.roomId;
        servers.addAll(response.result!.servers!);
        room = matrix.getRoomById(roomId!);
      }
      servers.addAll(identityParts.via);
      if (room != null) {
        if (room.isSpace) {
          // VRouter.of(context).toSegments(['rooms']);
          Get.toNamed(Routers.memberInfoRoute, parameters: {
            'roomId': room.id,
          });
          return;
        }
        // we have the room, so....just open it
        // if (event != null) {
        //   VRouter.of(context).toSegments(['rooms', room.id],
        //       queryParameters: {'event': event});
        // } else {
        //   VRouter.of(context).toSegments(['rooms', room.id]);
        // }
        return;
      } else {
        // await showModalBottomSheet(
        //   context: context,
        //   builder: (c) => PublicRoomBottomSheet(
        //     roomAlias: identityParts.primaryIdentifier,
        //     outerContext: context,
        //   ),
        // );
      }
      // if (roomIdOrAlias.sigil == '!') {
      //   if (await showOkCancelAlertDialog(
      //         useRootNavigator: false,
      //         context: context,
      //         title: 'Join room $roomIdOrAlias',
      //       ) ==
      //       OkCancelResult.ok) {
      //     roomId = roomIdOrAlias;
      //     final response = await showFutureLoadingDialog(
      //       context: context,
      //       future: () => matrix.client.joinRoom(
      //         roomIdOrAlias,
      //         serverName: servers.isNotEmpty ? servers.toList() : null,
      //       ),
      //     );
      //     if (response.error != null) return;
      //     // wait for two seconds so that it probably came down /sync
      //     await showFutureLoadingDialog(
      //         context: context,
      //         future: () => Future.delayed(const Duration(seconds: 2)));
      //     if (event != null) {
      //       VRouter.of(context).toSegments(['rooms', response.result!],
      //           queryParameters: {'event': event});
      //     } else {
      //       VRouter.of(context).toSegments(['rooms', response.result!]);
      //     }
      //   }
      // }
    } else if (identityParts.primaryIdentifier.sigil == '@') {
      // print('primaryIdentifier @');
      Get.toNamed(Routers.contactInfoRoute, parameters: {
        'userId': identityParts.primaryIdentifier,
      });
      // await showModalBottomSheet(
      //   context: context,
      //   builder: (c) => ProfileBottomSheet(
      //     userId: identityParts.primaryIdentifier,
      //     outerContext: context,
      //   ),
      // );
    }
  }
}
