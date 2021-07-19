import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/chart.dart';

class PriceAssets extends StatelessWidget {

  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Obx(() => TimeSeriesChart(c.graphItems.value, animate: true,)),
        ),
        Container(
          child: Obx(() => Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: c.graphPeriod
                  .map((e) => Container(
                      child: BorderButton(
                          text: e.label, onPressed: () => { c.selectGraph(e.value) }, isActive: e.value == c.selectedGraphPeriod.value.value),
                      margin: const EdgeInsets.only(right: 5)))
                  .toList())),
        )
      ],
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  BorderButton({this.text, this.onPressed, this.isActive});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: isActive ? Enum.firstColor : Colors.black54 , fontSize: 11)),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: isActive
                            ? Enum.firstColor
                            : Colors.grey)))));
  }
}