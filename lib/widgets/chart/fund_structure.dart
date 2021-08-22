import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:intl/intl.dart';
import 'package:radar/widgets/chart/chart.dart';

class FundStructure extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final c = Get.find<FundController>();
    final oCcy = new NumberFormat("#,##0", "ru_RU");

    return Column(
      children: [
        Container(
            height: 250,
            child: Stack(
              children: [
                GaugeChart(),
                Container(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Center(
                    child: Text("Общая стоимость")
                  ),
                ),
                Center(
                  child: Obx(() => Text(
                      oCcy.format(c.sumAmount.value) + ' руб.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                )
              ],
            )),
        Container(
          child: Obx(() => Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: c.fundsStructure.map((e) {
                return FundStructureItem(e.percent, e.diffPercent, e.amount, e.diffAmount, c.getLabelTypeByValue(e.type), color: e.color);
              }).toList()
          )),
        ),
      ],
    );
  }
}

class FundStructureItem extends StatelessWidget {

  final double percent;
  final double diffPercent;
  final double amount;
  final double diffAmount;
  final String title;
  final Color color;


  FundStructureItem(this.percent, this.diffPercent, this.amount, this.diffAmount,
      this.title, {this.color});

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
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          color: color,
                          margin: const EdgeInsets.only(right: 5),
                        ),
                        Container(
                          child: Text(
                            "$title",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$percent%",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        " / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        oCcy.format(amount) + " руб.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueGrey),
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
