// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/app_constants.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/utils/dialog_utils.dart';
import 'package:sola/common/widgets/dialog/content_dialog.dart';

class LoginController extends GetxController {
  final form = FormGroup({
    'userName': FormControl(
      validators: [Validators.required],
    ),
    'password': FormControl(
      validators: [Validators.required],
    ),
    'orgName': FormControl(
      validators: [Validators.required],
    )
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onLogin() async {
    try {
      final client = Get.find<ClientService>().client;
      await client.checkHomeserver(Uri.https(AppConstants.homeService));
      await client.login(
        LoginType.mLoginPassword,
        password: form.control('password').value,
        identifier:
            AuthenticationUserIdentifier(user: form.control('userName').value),
      );
      Get.offNamed(Routers.indexRoute);
    } catch (e) {
      DialogUtils.showDialog(child: ContentDialog(content: e.toString()));
    }
  }

  void onRegister() {
    Get.offNamed(Routers.registerRoute);
  }

  void onForgotPassword() {
    Get.toNamed(Routers.forgotPasswordRoute);
  }
}
