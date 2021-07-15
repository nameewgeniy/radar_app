import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/api/api.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/FundState.dart';
import 'package:radar/pages/pages.dart';
import 'package:radar/routes/routes.dart';

void main() => runApp(GetMaterialApp(
      getPages: Pages.pages,
      initialRoute: Routes.initial,
      theme: ThemeData(
        primaryColor: Enum.firstColor,
      ),
    ));

class MainController extends GetxController {
  var isSelected = <bool>[false, false, false, false, false, false].obs;
  var currentDateIndex = 1.obs;

  var fundsState = List<FundState>().obs;
  var fundsStateList = List<FundState>().obs;
  var selectedFund = "Выберите фонд".obs;
  var selectedFundId = "".obs;
  var allFunds = List().obs;

  @override
  void onInit() {
    loadAllFunds();
    super.onInit();
  }

  MainController() {
    var data = <Map>[
      {"percent": "70.47", "title": "Акции"},
      {"percent": "17.62", "title": "Корпоративные облигации"},
      {"percent": "5.68", "title": "Денежные средства"},
      {"percent": "4.19", "title": "Ценные бумаги РФ"}
    ];

    fundsState.assignAll(data.map((e) => FundState.fromJson(e)));

    fundsStateList.assignAll(data.map((e) => FundState.fromJson(e)));
  }

  loadAllFunds() async {
    var response = await Api().fetchFunds();
    allFunds.assignAll(response);

    if (allFunds.isNotEmpty) {
      selectedFundId.value = allFunds.value[0]["id"];
      selectedFund.value = allFunds.value[0]["funds_comp_name_rus"];
    }
  }

  selectFund(id) {
    var data = allFunds.value.where((e) => (e["id"].contains(id)));

    if (data.length > 0) {
      selectedFund.value = data.first["funds_comp_name_rus"];
      selectedFundId.value = data.first["id"];
    }
  }

  selectedDate(index) async {
    currentDateIndex.value = index;

    var response =
        await Api().get(method: "http://192.168.0.107:9667/api/GetStateAssets");

    print(response[0]);
    //response.forEach((k,v) => print('${k}: ${v}'));

    var fund = FundState.fromJson(response[0]);

    fundsState.add(fund);
  }

  searchListeneer(string) {}
}
