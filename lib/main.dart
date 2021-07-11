import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/models/FundState.dart';
import 'package:radar/pages/pages.dart';
import 'package:radar/routes/routes.dart';

void main() => runApp(GetMaterialApp(
  getPages: Pages.pages,
  initialRoute: Routes.initial,
));

class MainController extends GetxController{

  var isSelected = <bool>[false, false, false, false, false, false].obs;

  var fundsState = List<FundState>().obs;
  var fundsStateList = List<FundState>().obs;

  MainController() {

    var data = <Map>[
      {
        "percent": "70.47",
        "title": "Акции"
      },
      {
        "percent": "17.62",
        "title": "Корпоративные облигации"
      },
      {
        "percent": "5.68",
        "title": "Денежные средства"
      },
      {
        "percent": "4.19",
        "title": "Ценные бумаги РФ"
      },
      {
        "percent": "2.04",
        "title": "Муниципальные ценные бумаги"
      },
    ];

    fundsState.assignAll(
        data.map((e) => FundState.fromJson(e))
    );

    fundsStateList.assignAll(
        data.map((e) => FundState.fromJson(e))
    );

  }

  selectedDate(text) {
    fundsState.add(FundState(13, "test"));
  }
}
