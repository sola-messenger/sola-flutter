// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/widgets/dialog/privacy_level_dialog.dart';

class PrivacyLevelListTile extends StatelessWidget {
  final bool isPrivate;
  final ValueChanged<bool> onChangePrivate;

  const PrivacyLevelListTile({
    Key? key,
    required this.isPrivate,
    required this.onChangePrivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Privacy Level',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(PrivacyLevelDialog(onConfirm: () {}));
                },
                child: const Icon(Icons.info),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  onChangePrivate.call(true);
                },
                borderRadius: BorderRadius.circular(8),
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: isPrivate == true ? Colors.blue : Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'High',
                        style: TextStyle(
                          color: isPrivate == true ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  onChangePrivate.call(false);
                },
                borderRadius: BorderRadius.circular(8),
                child: Ink(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: isPrivate == false ? Colors.blue : Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Normal',
                        style: TextStyle(
                          color:
                              isPrivate == false ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
