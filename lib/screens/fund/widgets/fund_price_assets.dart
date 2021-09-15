import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/main.dart';
import 'package:radar/screens/funds/widgets/chart.dart';
import 'package:radar/widgets/button/border_button.dart';

class FundPriceAssets extends StatelessWidget {

  final FundController c = Get.find<FundController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Obx(() => TimeSeriesChart(c.navItems.value, animate: true,)),
        ),
        Container(
          child: Obx(() => Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: c.navPeriod
                  .map((e) => Container(
                      child: BorderButton(
                          text: e.label, onPressed: () => { c.selectNav(e.value) }, isActive: e.value == c.selectedNavPeriod.value.value),
                      margin: const EdgeInsets.only(right: 5)))
                  .toList())),
        )
      ],
    );
  }
}
