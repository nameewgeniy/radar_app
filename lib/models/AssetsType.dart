// To parse this JSON data, do
//
//     final assetsType = assetsTypeFromMap(jsonString);

import 'dart:convert';

AssetsType assetsTypeFromMap(String str) => AssetsType.fromMap(json.decode(str));

String assetsTypeToMap(AssetsType data) => json.encode(data.toMap());

class AssetsType {
  AssetsType({
    this.percent,
    this.title,
  });

  double percent;
  String title;

  factory AssetsType.fromMap(json) => AssetsType(
    percent: double.parse(json["percent"]),
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "percent": percent,
    "title": title,
  };
}
