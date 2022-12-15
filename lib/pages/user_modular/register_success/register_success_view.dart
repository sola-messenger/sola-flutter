// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'register_success_controller.dart';

class RegisterSuccessPage extends GetView<RegisterSuccessController> {
  const RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterSuccessController(),
      builder: (ctl) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 64,
                ),
                const Center(
                  child: Text('Congratulations!'),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (ctl.isCreateOrg == 'true')
                  const Text(
                    'You have successfully created the space\n ericfang\'s Space',
                    textAlign: TextAlign.center,
                  )
                else
                  const Text(
                    'You have successfully joined the organization\n ericfang\'s Space',
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(
                  height: 46,
                ),
                ElevatedButton(
                    onPressed: ctl.onConfirm, child: Text('Continue'.tr)),
              ],
            ),
          ),
        );
      },
    );
  }
}
