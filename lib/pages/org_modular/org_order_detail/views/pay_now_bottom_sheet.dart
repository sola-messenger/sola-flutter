

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/widgets/form_group_widget.dart';
import 'package:sola/common/widgets/input_column_border_field.dart';

class PayNowBottomSheet extends StatelessWidget {
  final FormGroup formGroup;
  final VoidCallback onCheckout;
  const PayNowBottomSheet({Key? key, required this.formGroup, required this.onCheckout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Center(
                  child: Text('Choose Payment method'.tr),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: const Icon(Icons.close),
                  ),
                )
              ],
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
              height: 16,
            ),
            ElevatedButton(onPressed: onCheckout, child: Text('Checkout'.tr)),
          ],
        ),
      ),
    );
  }
}
