import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:radar/main.dart';

class Circulars extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final c = Get.find<MainController>();

    return Container(
      child: Obx(() => Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: c.assetsTypes.map((e) {
            return Circular(e.percent, c.getLabelTypeByValue(e.title));
          }).toList()
      )),
    );
  }
}

class Circular extends StatelessWidget {
  final double percent;
  final String title;

  Circular(this.percent, this.title);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Container(
                child: Text(
                  "${title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              )),
          Container(
            width: 170,
            child: Column(
              children: [
                LinearPercentIndicator(
                  alignment: MainAxisAlignment.spaceBetween,
                  width: 140,
                  lineHeight: 5,
                  animation: true,
                  trailing: Text(
                    "${percent.ceil()}%",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  percent: percent / 100,
                  progressColor: Color.fromARGB(255, 215, 66, 54),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
