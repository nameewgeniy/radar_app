import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/api/api.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/AssetsType.dart';
import 'package:radar/models/Period.dart';
import 'package:radar/pages/funds/widgets/chart.dart';
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

  var types = [
    {
      "value": "stock",
      "label": "Акции",
    },
    {
      "value": "etf",
      "label": "ETF",
    },
    {
      "value": "bond",
      "label": "Облигации",
    },
    {
      "value": "foreign_stock",
      "label": "Иностранные акции",
    },
  ];

  var fundsStructure = <FundStructure>[].obs;
  var branches = <FundStructure>[].obs;
  var selectedFund = Fund().obs;
  var selectedMoreItems = <Map>[].obs;
  var selectedFundId = 0.obs;
  var allFunds = [].obs;
  var assetsFund = [].obs;
  var sumAmount = 500000.0.obs;

  var homeDatePeriod = <Period>[
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedHomeDatePeriod = Period().obs;

  var assetsPeriod = <Period>[
    Period(label: "1 мес.", value: 1, isActive: false),
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedAssetsPeriod = Period().obs;

  var graphPeriod = <Period>[
    Period(label: "1 мес.", value: 1, isActive: false),
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedGraphPeriod = Period().obs;

  var graphItems = <GraphRow>[
    new GraphRow(new DateTime(2020, 1, 25), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2020, 2, 26), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2020, 3, 27), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2020, 4, 28), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2020, 5, 29), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2020, 6, 30), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2021, 1, 01), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2021, 2, 02), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2021, 3, 03), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2021, 4, 04), Random().nextInt(100).toInt()),
    new GraphRow(new DateTime(2021, 5, 05), Random().nextInt(100).toInt()),
  ].obs;

  @override
  void onInit() {
    loadAllFunds();
    super.onInit();
  }

  MainController() {

    selectHomePeriod(3);

    loadFundsStructure();
    loadBranch();

    selectGraph(1);
    selectAssetsPeriod(1);
  }

  selectGraph(value) {
    selectedGraphPeriod.value = graphPeriod.firstWhere((e) => (e.value == value));

    graphItems.assignAll([
      new GraphRow(new DateTime(2020, 1, 25), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2020, 2, 26), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2020, 3, 27), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2020, 4, 28), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2020, 5, 29), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2020, 6, 30), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2021, 1, 01), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2021, 2, 02), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2021, 3, 03), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2021, 4, 04), Random().nextInt(100).toInt()),
      new GraphRow(new DateTime(2021, 5, 05), Random().nextInt(100).toInt()),
    ]);
  }

  selectAssetsPeriod(value) {
    selectedAssetsPeriod.value = assetsPeriod.firstWhere((e) => (e.value == value));
  }

  selectHomePeriod(value) {
    selectedHomeDatePeriod.value = homeDatePeriod.firstWhere((e) => (e.value == value));
    loadFundsStructure();
    loadBranch();
  }

  loadAllFunds() async {
    var response = await Api().fetchFunds();
    allFunds.assignAll(response);
  }

  loadAssetsByFundId(id) async {
    var response = await Api().fetchAssetsByFund(id);
    assetsFund.assignAll(response);
  }

  loadFundsStructure() async {
    var response = await Api().fetchFundsStructure(selectedHomeDatePeriod.value.value);

    fundsStructure.clear();
    sumAmount.value = 0.0;

    var i = 0;
    response.forEach((element) {
      var item = FundStructure.fromMap(element);

      item.color = FundStructureColors[i++];

      fundsStructure.add(item);
      sumAmount.value += item.amount;
    });
  }

  loadBranch() async {
    var response = await Api().fetchBranch(selectedHomeDatePeriod.value.value);
    branches.clear();
    response.forEach((element) =>
        branches.add(FundStructure.fromMap(element))
    );
  }

  getLabelTypeByValue(value) {
    return types.firstWhere((element) => element["value"] == value)["label"];
  }

  selectFund(id) {
    var data = allFunds.where((e) => (e["ID"] == id));

    if (data.length > 0) {
      selectedFund.value = Fund.fromMap(data.first);

      selectedMoreItems.clear();

      if (selectedFund.value.fundsCompNameRus != null) {
        selectedMoreItems.add({
          "name": "Компания",
          "value": selectedFund.value.fundsCompNameRus
        });
      }

      if (selectedFund.value.fundsTypesRus != null) {
        selectedMoreItems.add({
          "name": "Тип фонда",
          "value": selectedFund.value.fundsTypesRus
        });
      }

      if (selectedFund.value.fundsObjectNameRus != null) {
        selectedMoreItems.add({
          "name": "Тип активов",
          "value": selectedFund.value.fundsObjectNameRus
        });
      }

      if (selectedFund.value.registrationDate != null) {
        selectedMoreItems.add({
          "name": "Дата открытия",
          "value": selectedFund.value.registrationDate.toString().split(" ").first
        });
      }

    }
  }
}
