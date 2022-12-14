import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'package:sola/pages/org_modular/org_detail/org_detail_controller.dart';
import 'package:sola/pages/org_modular/org_order_detail/views/org_order_detail_tap_item.dart';
import 'org_order_detail_controller.dart';

class OrgOrderDetailPage extends GetView<OrgOrderDetailController> {
  const OrgOrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrgOrderDetailController(),
        builder: (ctl) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Order Details'.tr),
              ),
              body: _buildViews(ctl));
        });
  }

  Widget _buildViews(OrgOrderDetailController ctl) => ListView(
        children: [
          Text('Waiting for payment, 5 days remaining'.tr),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OrgOrderDetailTapItem(
                  title: 'Pay Now', onTap: ctl.onPayNow, image: ''),
              OrgOrderDetailTapItem(
                  title: 'Edit Order', onTap: ctl.onEditOrder, image: ''),
            ],
          ),
          FormGroupWidget(
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Use Perod'),
                  Text('3 Months'),
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
            ],
          ),
        ],
      );
}
