import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';

class GroupButtons extends StatelessWidget {
  final FundController c = Get.find<FundController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: c.homeDatePeriod
              .map((e) => Container(
              child: BorderButton(
                  text: e.label,
                  onPressed: () =>
                  {c.selectHomePeriod(e.value)},
                  isActive: e.value ==
                      c.selectedHomeDatePeriod.value.value),
              margin: const EdgeInsets.only(right: 5)))
              .toList())),
    );
  }
}

