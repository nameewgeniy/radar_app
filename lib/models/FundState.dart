class FundState {

  double percent;
  String title;

  FundState(this.percent, this.title);

  factory FundState.fromJson(Map<dynamic, dynamic> json) => FundState(double.parse(json["percent"]), json["title"]);
}