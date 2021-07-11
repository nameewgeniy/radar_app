import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class ListFundState extends StatelessWidget {

  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
        children: c.fundsStateList.map(
            (element) => ListFundStateItem(element.title, element.percent)
        ).toList()
      )),
    );
  }

}

class ListFundStateItem extends StatelessWidget {

  final String text;
  final double percent;

  ListFundStateItem(this.text, this.percent);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${text}",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),
          ),
          Text(
            "${percent}%",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}