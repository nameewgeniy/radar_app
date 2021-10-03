import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:intl/intl.dart';
import 'package:radar/routes/routes.dart';

class FundTypeStructure extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

    return Obx(() => Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: c.fundStructureByType.map((e) {
          return FundStructureItem(e.percent, e.diffPercent, e.amount, e.diffAmount, c.getLabelTypeByValue(e.name), color: e.color, type: e.name);
        }).toList()
    ));
  }

}

class FundStructureItem extends StatelessWidget {

  final double percent;
  final double diffPercent;
  final double amount;
  final double diffAmount;
  final String title;
  final String type;
  final Color color;


  FundStructureItem(this.percent, this.diffPercent, this.amount, this.diffAmount,
      this.title, {this.color, this.type});

  final oCcy = new NumberFormat("#,##0", "ru_RU");

  @override
  Widget build(BuildContext context) {

    final arg = Get.arguments;

    return TextButton(
      onPressed: () => { Get.toNamed(Routes.fund_type_assets, arguments: {"title": title, "id": arg["id"], "type": type}) },
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
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        " / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      ),
                      Text(
                        oCcy.format(amount) + " руб.",
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
                        style: TextStyle(fontSize: 12, color: diffPercent == 0 ? Colors.grey : diffPercent > 0 ? Colors.lightGreen : Colors.red),
                      ),
                      Text(
                        " / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        oCcy.format(diffAmount) + " руб.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: diffAmount == 0 ? Colors.grey : diffAmount > 0 ? Colors.lightGreen : Colors.red),
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
