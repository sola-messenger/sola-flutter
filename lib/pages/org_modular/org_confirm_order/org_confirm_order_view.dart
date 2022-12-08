import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/form_group_widget.dart';
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
            ),
            body: _buildViews(),
          );
        });
  }

  Widget _buildViews() => ListView(
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
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Pay Amount',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                Text('\$ 45.00',style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ]),
          const SizedBox(
            height: 16,
          ),
           FormGroupWidget(
            addDivider: false,
            children: [
              Text('Payment Method'),
              SizedBox(
                height: 8,
              ),
              Center(child: Text('Paypal'),),
              Center(child: Text('Google Pay'),),
              Center(child: Text('Apply Pay'),),
              Text('Credit Card'),
          ]),
        ],
      );
}
