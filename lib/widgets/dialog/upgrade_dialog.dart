import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpgradeDialog extends StatelessWidget {
  final VoidCallback onUpgrade;
  final String versionName;
  final String updateInfo;

  const UpgradeDialog(
      {super.key,
      required this.onUpgrade,
      required this.versionName,
      required this.updateInfo});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: const Border(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('New Version'.tr),
              const SizedBox(
                height: 16,
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Text('APP version:$versionName')),
              const SizedBox(
                height: 16,
              ),
               Text(updateInfo),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(onPressed: onUpgrade, child: Text('Update'.tr)),
            ],
          ),
        ),
      ),
    );
  }
}
