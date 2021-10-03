// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

StructureItem assetsTypeFromMap(String str) => StructureItem.fromMap(json.decode(str));

List<StructureItem> structureItemsFromList(List list) {
    List<StructureItem> items = [];

    var i = 0;
    list.forEach((element) {
      var item = StructureItem.fromMap(element);
      item.color = StructureItem.structureColors[i++];
      items.add(item);
    });

    return items;
}

String assetsTypeToMap(StructureItem data) => json.encode(data.toMap());



class StructureItem {

  static List structureColors = [
    Color.fromARGB(255, 121, 174, 242),
    Color.fromARGB(255, 205, 159, 234),
    Color.fromARGB(255, 183, 233, 133),
    Color.fromARGB(255, 251, 215, 5),
  ];

  double percent;
  double diffPercent;
  double amount;
  double diffAmount;
  String name;
  Color color;


  StructureItem({ this.percent, this.diffPercent, this.amount,
    this.diffAmount, this.name, this.color });

  factory StructureItem.fromMap(json) {
    return StructureItem(
        percent: double.parse(json["percent"].toStringAsFixed(2)),
        diffPercent: double.parse(json["diff_percent"].toStringAsFixed(2)),
        amount: double.parse(json["amount"].toStringAsFixed(2)),
        diffAmount: double.parse(json["diff_amount"].toStringAsFixed(2)),
        name: json["type"],
      );
  }



  Map<String, dynamic> toMap() => {
    "percent": percent,
    "name": name,
    "diff_percent": diffPercent,
    "diff_amount": diffAmount,
    "amount": amount
  };
}
