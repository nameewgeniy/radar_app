import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:intl/intl.dart';

class ListFundState extends StatelessWidget {

  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
        children: c.branches.map(
            (e) => Container(
                padding: const EdgeInsets.only(top: 5),
                child: ListFundStateItem(
                  text: e.type,
                  percent: e.percent,
                  amount: e.amount,
                  diffPercent: e.diffPercent,
                  diffAmount: e.diffAmount,
                )
            )
        ).toList()
      )),
    );
  }

}

class ListFundStateItem extends StatelessWidget {

  final String text;
  final double percent;
  final double diffPercent;
  final double amount;
  final double diffAmount;

  ListFundStateItem(
      {this.text,
      this.percent,
      this.diffPercent,
      this.amount,
      this.diffAmount});

  final oCcy = new NumberFormat("#,##0", "ru_RU");
  var colorPercent = Colors.grey;
  var colorAmount = Colors.grey;

  @override
  Widget build(BuildContext context) {

    if (diffPercent > 0) {
      colorPercent = Colors.lightGreen;
    } else if (diffPercent < 0) {
      colorPercent = Colors.red;
    }

    if (diffAmount > 0) {
      colorAmount = Colors.lightGreen;
    } else if (diffAmount < 0) {
      colorAmount = Colors.red;
    }

    return TextButton(
      onPressed: () => {},
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Container(
                      width: 150,
                      child: Text(
                        "$text",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                      ),
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$percent%",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        " / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        oCcy.format(amount) + " р.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Container(
                      child: Text(
                        "динамика",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$diffPercent%",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: colorPercent),
                      ),
                      Text(
                        " / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        oCcy.format(diffAmount) + " руб.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: colorAmount),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}