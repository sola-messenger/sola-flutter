import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'scan_qr_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrPage extends GetView<ScanQrController> {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ScanQrController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Scan QR code'),
            ),
            body: _buildViews(controller),
          );
        });
  }

  Widget _buildViews(ScanQrController controller) => Stack(
        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppColors.mainBlueColor,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 8,
            ),
          ),
        ],
      );
}
