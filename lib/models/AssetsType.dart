// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

FundStructure assetsTypeFromMap(String str) => FundStructure.fromMap(json.decode(str));

String assetsTypeToMap(FundStructure data) => json.encode(data.toMap());

const List FundStructureColors = [
  Color.fromARGB(255, 121, 174, 242),
  Color.fromARGB(255, 205, 159, 234),
  Color.fromARGB(255, 183, 233, 133),
  Color.fromARGB(255, 251, 215, 5),
];

class FundStructure {

  double percent;
  double diffPercent;
  double amount;
  double diffAmount;
  String type;
  Color color;


  FundStructure({ this.percent, this.diffPercent, this.amount,
      this.diffAmount, this.type, this.color });

  factory FundStructure.fromMap(json) {
    return FundStructure(
        percent: double.parse(json["percent"].toStringAsFixed(2)),
        diffPercent: double.parse(json["diff_percent"].toStringAsFixed(2)),
        amount: double.parse(json["amount"].toStringAsFixed(2)),
        diffAmount: double.parse(json["diff_amount"].toStringAsFixed(2)),
        type: json["type"],
      );
  }

  Map<String, dynamic> toMap() => {
    "percent": percent,
    "title": type,
    "diff_percent": diffPercent,
    "diff_amount": diffAmount,
    "amount": amount,
    "color": color,
  };

  
}
