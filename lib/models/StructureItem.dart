// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

StructureItem assetsTypeFromMap(String str) => StructureItem.fromMap(json.decode(str));

String assetsTypeToMap(StructureItem data) => json.encode(data.toMap());


class StructureItem {

  double percent;
  double diffPercent;
  double amount;
  double diffAmount;
  String name;


  StructureItem({ this.percent, this.diffPercent, this.amount,
      this.diffAmount, this.name });

  factory StructureItem.fromMap(json) {
    return StructureItem(
        percent: double.parse(json["percent"].toStringAsFixed(2)),
        diffPercent: double.parse(json["diff_percent"].toStringAsFixed(2)),
        amount: double.parse(json["amount"].toStringAsFixed(2)),
        diffAmount: double.parse(json["diff_amount"].toStringAsFixed(2)),
        name: json["name"],
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
