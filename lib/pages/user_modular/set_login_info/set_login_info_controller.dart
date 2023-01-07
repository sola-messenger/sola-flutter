// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/app_constants.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/congratulations_dialog.dart';

class SetLoginInfoController extends GetxController {
  FormGroup formGroup = FormGroup({
    'userName': FormControl(validators: [Validators.required]),
    'password': FormControl(validators: [Validators.required]),
  });
  void onConfirm() async{
    final userName = formGroup.control("userName");
    final password = formGroup.control("password");
    final client = Get.find<ClientService>().client;
    await client.uiaRequestBackground(
          (auth) => client.register(
        username: userName.value,
        password: password.value,
        initialDeviceDisplayName:AppConstants.clientName,
        auth: auth,
      ),
    );
    DialogUtils.showDialog(child: CongratulationsDialog(onContinue: () {
      Get.toNamed(Routers.orgSetInfoRoute);
    }));
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}


}
