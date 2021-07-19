// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

Branch branchFromMap(String str) => Branch.fromMap(json.decode(str));

String branchToMap(Branch data) => json.encode(data.toMap());

class Branch {
  Branch({
    this.percent,
    this.title,
  });

  double percent;
  String title;

  factory Branch.fromMap(json) => Branch(
    percent: double.parse(json["percent"]),
    title: json["branch"] != "" ? json["branch"] : "Не определена",
  );

  Map<String, dynamic> toMap() => {
    "percent": percent,
    "title": title,
  };
}
