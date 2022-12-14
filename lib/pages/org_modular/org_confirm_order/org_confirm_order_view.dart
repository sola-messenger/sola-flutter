import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/widgets/index.dart';
import 'package:sola/common/widgets/input_column_border_field.dart';
import 'org_confirm_order_controller.dart';

class OrgConfirmOrderPage extends GetView<OrgConfirmOrderController> {
  const OrgConfirmOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrgConfirmOrderController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Confirm Order'),
              leading: BackButton(
                onPressed: ctl.onBack,
              ),
            ),
            body: SafeArea(child: _buildViews(ctl)),
          );
        });
  }

  Widget _buildViews(OrgConfirmOrderController ctl) => ReactiveForm(
        formGroup: ctl.fromGroup,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          children: [
            FormGroupWidget(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Organization Name'),
                  Text('Eric\'s Space'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Number of Organization Members'),
                  Text('15 Members'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Description'),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pay Amount',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$ 45.00',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 16,
            ),
            FormGroupWidget(addDivider: false, children: [
              Text('Payment Method'),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text('Paypal'),
              ),
              Center(
                child: Text('Google Pay'),
              ),
              Center(
                child: Text('Apply Pay'),
              ),
              InputColumnBorderField(
                  title: 'Credit Card', formKey: 'cc', hint: 'Card Number'),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('Expiry Date'),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: ReactiveTextField(
                          keyboardType: TextInputType.number,
                          formControlName: 'mm',
                          decoration: InputDecoration(
                            hintText: 'MM'.tr,
                            border: const OutlineInputBorder(
                              gapPadding: 0,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('/'),
                      ),
                      SizedBox(
                        width: 80,
                        child: ReactiveTextField(
                          keyboardType: TextInputType.number,
                          formControlName: 'yy',
                          decoration: InputDecoration(
                            hintText: 'YY'.tr,
                            border: const OutlineInputBorder(
                              gapPadding: 0,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('CVV '),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 80,
                          child: ReactiveTextField(
                            keyboardType: TextInputType.number,
                            formControlName: 'cvv',
                            decoration: InputDecoration(
                              hintText: 'Enter CVV'.tr,
                              border: const OutlineInputBorder(
                                gapPadding: 0,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: ctl.onCheckout, child: const Text('Checkout'))
          ],
        ),
      );
}
