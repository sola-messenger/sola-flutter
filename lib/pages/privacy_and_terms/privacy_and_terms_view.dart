import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'privacy_and_terms_controller.dart';

class PrivacyAndTermsPage extends GetView<PrivacyAndTermsController> {
  const PrivacyAndTermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PrivacyAndTermsController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text(ctl.type!),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
              child: Image.asset(ctl.image),
            ),
          );
        });
  }
}
