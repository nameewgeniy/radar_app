// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

BranchStructure assetsTypeFromMap(String str) => BranchStructure.fromMap(json.decode(str));

String assetsTypeToMap(BranchStructure data) => json.encode(data.toMap());


class BranchStructure {

  double percent;
  double diffPercent;
  double amount;
  double diffAmount;
  String name;


  BranchStructure({ this.percent, this.diffPercent, this.amount,
      this.diffAmount, this.name });

  factory BranchStructure.fromMap(json) {
    return BranchStructure(
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
