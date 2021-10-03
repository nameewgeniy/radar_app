// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

Assets assetsTypeFromMap(String str) => Assets.fromMap(json.decode(str));

String assetsTypeToMap(Assets data) => json.encode(data.toMap());


class Assets {

  double percent;
  double amount;
  String name ;
  String id;


  Assets({ this.percent, this.id, this.amount, this.name });

  factory Assets.fromMap(json) {
    return Assets(
        percent: double.parse(json["percent"].toStringAsFixed(2)),
        amount: double.parse(json["amount"].toStringAsFixed(2)),
        name: json["name"],
        id: json["id"],
      );
  }

  Map<String, dynamic> toMap() => {
    "percent": percent,
    "name": name,
    "amount": amount,
    "id": id,
  };
}
