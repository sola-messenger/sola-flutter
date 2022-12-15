// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class PrivacyLevelDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const PrivacyLevelDialog({Key? key, required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
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
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Privacy level description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 8,
              ),
              Text('Our message privacy level is divided into 2 levels:'),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Hight Level'),
                ],
              ),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Normal Level'),
                ],
              ),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin'),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: (){
                Get.back();
                onConfirm();
              }, child: const Text('Confirm')),
            ],
          ),
        ),
      ),
    );
  }
}
