import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class ListFundState extends StatelessWidget {

  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
        children: c.branches.map(
            (e) => Container(
                height: 40,
                child: ListFundStateItem(e.title, e.percent)
            )
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
    return ListTile(
      dense:true,
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
      title: Text(
        "${text}",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      trailing: Column(
        children: [
          Text(
            "${percent}%",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            Random().nextDouble().toStringAsFixed(2) + "%",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
          ),
        ],
      ),
    );
  }
}