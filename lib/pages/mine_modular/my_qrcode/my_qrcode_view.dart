// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/future/profile_future_widget.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';

// Project imports:
import 'my_qrcode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrcodePage extends GetView<MyQrcodeController> {
  const MyQrcodePage({Key? key}) : super(key: key);

  Widget _buildView(MyQrcodeController ctl) =>
      ProfileFutureWidget(buildProfile: (profile) {
        return ListView(
          children: [
            const SizedBox(
              height: 32,
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 32, right: 32, top: 40),
                  height: 326,
                  decoration: BoxDecoration(
                    color: const Color(0x1A353434),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Avatar(
                        mxContent: profile.avatarUrl,
                        name: profile.displayName,
                        onTap: () {},
                        size: 64,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        '${profile.displayName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 21 / 14,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      QrImage(
                        size: 203,
                        data: profile.userId,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Center(
              child: Text(
                'Share this code with people so they can scan\n it to add you and start chatting'
                    .tr,
                style: const TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Center(
                child: FillButton(
                    buttonSizeEnum: ButtonSizeEnum.normal,
                    onPressed: ctl.onShareMycode,
                    title: 'Share My Code')),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: GestureDetector(
                onTap: ctl.onScanCode,
                child: Text(
                  'Scan QR Code'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        );
      });

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
