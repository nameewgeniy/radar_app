import 'dart:convert';

Period periodFromMap(String str) => Period.fromMap(json.decode(str));

String periodToMap(Period data) => json.encode(data.toMap());

class Period {
  Period({
    this.label,
    this.value,
    this.isActive,
  });

  String label;
  int value;
  bool isActive;

  factory Period.fromMap(Map<String, dynamic> json) => Period(
    label: json["label"],
    value: json["value"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toMap() => {
    "label": label,
    "value": value,
    "is_active": isActive,
  };
}
