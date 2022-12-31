// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/future/profile_future_widget.dart';

// Project imports:
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'package:sola/r.dart';
import 'add_contact_controller.dart';

class AddContactPage extends GetView<AddContactController> {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddContactController(),
        id: 'add contact',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('New Contacts'.tr),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(AddContactController ctl) => ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          const SearchBar(
            title: 'Search User ID',
          ),
          const SizedBox(
            height: 12,
          ),
          ProfileFutureWidget(
            buildProfile: (profile) => ClickListTile(
              title: 'My ID',
              onTap: () {},
              contentWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    profile.userId ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 22 / 14,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      ctl.onCopy(profile.userId);
                    },
                    child: const Text(
                      'Copy',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 22 / 14,
                        color: AppColors.mainBlueColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ClickListTile(
            onTap: ctl.onNavMyQrCode,
            title: 'My QR Code',
            contentWidget: Image.asset(
              R.assetsIconQrIcon,
              width: 25,
              height: 25,
            ),
          ),
          ClickListTile(
            title: 'Scan QR Code',
            onTap: ctl.onScanQrCode,
          ),
        ],
      );
}
