// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

FundsStructure assetsTypeFromMap(String str) => FundsStructure.fromMap(json.decode(str));

String assetsTypeToMap(FundsStructure data) => json.encode(data.toMap());

const List FundStructureColors = [
  Color.fromARGB(255, 121, 174, 242),
  Color.fromARGB(255, 205, 159, 234),
  Color.fromARGB(255, 183, 233, 133),
  Color.fromARGB(255, 251, 215, 5),
];

class FundsStructure {

  double percent;
  double diffPercent;
  double amount;
  double diffAmount;
  String type;
  Color color;


  FundsStructure({ this.percent, this.diffPercent, this.amount,
      this.diffAmount, this.type, this.color });

  factory FundsStructure.fromMap(json) {
    return FundsStructure(
        percent: double.parse(json["percent"].toStringAsFixed(2)),
        diffPercent: double.parse(json["diff_percent"].toStringAsFixed(2)),
        amount: double.parse(json["amount"].toStringAsFixed(2)),
        diffAmount: double.parse(json["diff_amount"].toStringAsFixed(2)),
        type: json["type"],
      );
  }

  Map<String, dynamic> toMap() => {
    "percent": percent,
    "type": type,
    "diff_percent": diffPercent,
    "diff_amount": diffAmount,
    "amount": amount,
    "color": color,
  };
}
