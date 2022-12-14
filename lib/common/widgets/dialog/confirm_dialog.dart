

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const ConfirmDialog({Key? key, required this.title, required this.content, required this.onCancel, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                Text(content, style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed: (){
                      Get.back();
                      onCancel.call();

                    }, child: Text('Cancel'.tr)),
                    ElevatedButton(onPressed: (){
                      Get.back();
                      onConfirm.call();
                    }, child: Text('Confirm'.tr)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
