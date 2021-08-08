// To parse this JSON data, do
//
//     final nav = navFromMap(jsonString);

import 'dart:convert';

Nav navFromMap(String str) => Nav.fromMap(json.decode(str));

String navToMap(Nav data) => json.encode(data.toMap());

class Nav {
  Nav({
    this.lastNav,
    this.date,
  });

  double lastNav;
  DateTime date;

  factory Nav.fromMap(Map<String, dynamic> json) => Nav(
    lastNav: double.parse(json["last_nav"]),
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "last_nav": lastNav,
    "date": date.toIso8601String(),
  };
}
