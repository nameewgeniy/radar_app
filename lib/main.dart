import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:radar/api/api.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/FundStructure.dart';
import 'package:radar/models/FundsStructure.dart';
import 'package:radar/models/Nav.dart';
import 'package:radar/models/Period.dart';
import 'package:radar/pages/pages.dart';
import 'package:radar/routes/routes.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('app');

  runApp(GetMaterialApp(
    getPages: Pages.pages,
    initialRoute: Routes.initial,
    theme: ThemeData(
      primaryColor: Enum.firstColor,
    ),
  ));

  box.close();
}

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

  var fundsStructure = <FundsStructure>[].obs;
  var branches = <FundsStructure>[].obs;
  var selectedFund = Fund().obs;
  var favoriteFunds = <int>[].obs;
  var selectedMoreItems = <Map>[].obs;
  var selectedFundId = 0.obs;
  var allFunds = [].obs;
  var findFunds = [].obs;
  var assetsFund = <FundStructure>[].obs;
  var sumAmount = 500000.0.obs;
  var searchFundsKeyword = "".obs;

  var homeDatePeriod = <Period>[
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "3 года", value: 36, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedHomeDatePeriod = Period().obs;

  var assetsPeriod = <Period>[
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "3 года", value: 36, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedAssetsPeriod = Period().obs;

  var navPeriod = <Period>[
    Period(label: "3 мес.", value: 3, isActive: false),
    Period(label: "6 мес.", value: 6, isActive: false),
    Period(label: "Год", value: 12, isActive: false),
    Period(label: "3 года", value: 36, isActive: false),
    Period(label: "Весь", value: 0, isActive: false),
  ].obs;

  var selectedNavPeriod = Period().obs;
  var navItems = <Nav>[].obs;

  @override
  void onInit() {
    loadAllFunds();
    super.onInit();
  }

  MainController() {

    selectHomePeriod(3);

    loadFundsStructure();
    loadBranch();

    selectNav(0);
    selectAssetsPeriod(0, null);
  }

  selectNav(value) {
    selectedNavPeriod.value = navPeriod.firstWhere((e) => (e.value == value));
    loadNav();
  }

  selectAssetsPeriod(value, fundId) {
    selectedAssetsPeriod.value = assetsPeriod.firstWhere((e) => (e.value == value));
    loadAssetsByFundId();
  }

  selectHomePeriod(value) {
    selectedHomeDatePeriod.value = homeDatePeriod.firstWhere((e) => (e.value == value));
    loadFundsStructure();
    loadBranch();
  }

  loadAllFunds() async {
    var response = await Api().fetchFunds();
    allFunds.assignAll(response);
    findFunds.assignAll(response);
  }

  loadAssetsByFundId() async {
    if (selectedAssetsPeriod.value.value != null && selectedFund.value.fundId != null) {
      var response = await Api().fetchAssetsByFund(selectedFund.value.fundId, selectedAssetsPeriod.value.value);

      assetsFund.clear();

      if (response != null) {
        response.forEach((element) =>
            assetsFund.add(FundStructure.fromMap(element))
        );
      }
    }
  }

  loadFundsStructure() async {
    var response = await Api().fetchFundsStructure(selectedHomeDatePeriod.value.value);

    fundsStructure.clear();
    sumAmount.value = 0.0;

    var i = 0;
    response.forEach((element) {
      var item = FundsStructure.fromMap(element);

      item.color = FundStructureColors[i++];

      fundsStructure.add(item);
      sumAmount.value += item.amount;
    });
  }

  loadBranch() async {
    var response = await Api().fetchBranch(selectedHomeDatePeriod.value.value);
    branches.clear();
    response.forEach((element) =>
        branches.add(FundsStructure.fromMap(element))
    );
  }

  loadNav() async {
    navItems.clear();

    if (selectedFund.value.fundId != null && selectedNavPeriod.value.value != null) {
      var response = await Api().fetchNavByFundId(selectedFund.value.fundId, selectedNavPeriod.value.value);

      if (response != null) {
        response.forEach((element) =>
            navItems.add(Nav.fromMap(element))
        );
      }
    }
  }

  getLabelTypeByValue(value) {
    return types.firstWhere((element) => element["value"] == value)["label"];
  }

  selectFund(id) {
    var data = allFunds.where((e) => (e["ID"] == id));

    if (data.length > 0) {
      selectedFund.value = Fund.fromMap(data.first);

      // Загрузка графика СЧА
      navItems.clear();
      loadNav();
      loadAssetsByFundId();

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

  filterFundsByKeywords(value) {

    if (value == "") {
      findFunds.assignAll(allFunds.value);
    }

    searchFundsKeyword.value = value;
    findFunds.assignAll(
        allFunds.value.where((element) => element["name_rus"].toString().toUpperCase().indexOf(
            value.toString().toUpperCase()
        ) >= 0)
    );
  }

  addFavoriteFund(id) {
    favoriteFunds.value.add(id);
    findFunds.refresh();
  }

  deleteFavoriteFund(id) {
    favoriteFunds.value.remove(id);
    findFunds.refresh();
  }

  isFavoriteFund(id) {

    if (favoriteFunds.value.isEmpty) {
      return false;
    }

    return favoriteFunds.value.firstWhere(
            (el) => el == id, orElse: () => null
    ) != null ? true : false;
  }
}
