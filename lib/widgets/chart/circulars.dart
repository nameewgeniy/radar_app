import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      width: width/2.2,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircularPercentIndicator(
              radius: 90.0,
              center: Wrap(
                children: [
                  Text(
                    "${percent.ceil()}%",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Random().nextDouble().toStringAsFixed(2) + "%",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              lineWidth: 8.0,
              percent: percent/100,
              progressColor: Color.fromARGB(255, 215, 66, 54),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "${title}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            )),
        ],
      ),
    );
  }
}
