// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class InviteBottomSheet extends StatelessWidget {
  final VoidCallback onInviteNow;

  const InviteBottomSheet({Key? key, required this.onInviteNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Center(
                child: Text('Invite people to your organization'.tr),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
              'You can invite organization members by \neclusive Invite Code'.tr,
          textAlign: TextAlign.center,),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(onPressed: onInviteNow, child: Text('Invite Now'.tr))
        ],
      ),
    );
  }
}
