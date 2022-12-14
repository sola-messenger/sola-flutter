import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/index.dart';

class OrgManagerController extends GetxController {
    final allowItem = 'Allow'.obs;
    Rx<OrganizationMembers?> priceData =(null as OrganizationMembers?).obs;
    RxInt preodData =3.obs;
    FormGroup formGroup = FormGroup({
      'orgName':FormControl(validators: [Validators.required]),
      'desc':FormControl(validators: [Validators.required]),
    });

  RxBool isAgree = false.obs;

  void onChangePrivacyCheckBox(bool? value){
    isAgree.call(value);
    isAgree.refresh();
  }

    @override
    void onInit() {
    super.onInit();
    }

    @override
    void onReady() {}

    @override
    void onClose() {}


  void onSelectAllow(String? value) {
    allowItem.call(value);
    allowItem.refresh();
  }

  void onSelectPrice(OrganizationMembers? value) {
    priceData.call(value);
    priceData.refresh();
  }

  void onSelectPreod(int value) {
    preodData.call(value);
    preodData.refresh();
  }

  void onNavServiceAgreement() {
    
  }

  void onConfirm() {
    Get.toNamed(Routers.orgOrderDetailRoute);

  }
}
