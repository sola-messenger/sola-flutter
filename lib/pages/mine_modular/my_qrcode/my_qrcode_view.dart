// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'my_qrcode_controller.dart';

class MyQrcodePage extends GetView<MyQrcodeController> {
  const MyQrcodePage({Key? key}) : super(key: key);
  Widget _buildView(MyQrcodeController ctl) => ListView(
        children: [
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 32, right: 32, top: 20),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Eric Fang',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              'Share this code with people so they can scan\n it to add you and start chatting'
                  .tr,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          ElevatedButton(
              onPressed: ctl.onShareMycode, child: Text('Share My Code'.tr)),
          const SizedBox(
            height: 16,
          ),
          TextButton(onPressed: ctl.onScanQrcode, child: Text('Scan QR Code'.tr)),

        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MyQrcodeController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My QR Code'.tr),
            ),
            body: _buildView(ctl),
          );
        });
  }
}
