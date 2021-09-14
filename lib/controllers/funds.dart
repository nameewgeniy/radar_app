import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:radar/api/api.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/FundStructure.dart';
import 'package:radar/models/FundsStructure.dart';
import 'package:radar/models/Nav.dart';
import 'package:radar/models/Period.dart';
import 'package:radar/widgets/chart/chart.dart';

class FundController extends GetxController {

  var allFunds = <Fund>[].obs;
  var findFunds = <Fund>[].obs;
  var favoriteFunds = <Fund>[].obs;
  var fundsAssetsStructure = <FundsStructure>[].obs;
  var sumAmount = 0.0.obs;
  var fundsStructureCharts = <GaugeSegment>[].obs;
/*
  @override
  void onInit() {
    loadAllFunds();
    super.onInit();
  }*/

  FundController() {

    loadAllFunds();
    loadFundsAssetsStructure();
    loadFundsBranchStructure();

    /*selectHomePeriod(3);
    selectNav(0);
    selectAssetsPeriod(0, null);*/
  }

  loadFundsAssetsStructure() async {
    var response = await Api().fetchFundsStructure(6, favoriteFunds.value.map((e) => e.id).toList());

    fundsAssetsStructure.clear();
    sumAmount.value = 0.0;

    var i = 0;
    response.forEach((element) {
      var item = FundsStructure.fromMap(element);

      item.color = FundStructureColors[i++];

      fundsAssetsStructure.add(item);
      sumAmount.value += item.amount;
    });
  }

  loadFundsBranchStructure() async {
    var response = await Api().fetchBranch(6, favoriteFunds.value.map((e) => e.id).toList());
    branches.clear();
    response.forEach((element) =>
        branches.add(FundsStructure.fromMap(element))
    );
  }

  loadAllFunds() async {
    var response = await Api().fetchFunds();

    allFunds.assignAll(response);
    findFunds.assignAll(response);
    favoriteFunds.assignAll(response);
  }

  loadFundStructureByFundId() async {
    if (selectedFund.value.fundId != null) {
      var items = await Api().fetchFundStructure(selectedFund.value.fundId, 3);
      assetsFund.assignAll(items);
    }
  }

  addFavoriteFund(Fund f) {
    favoriteFunds.value.add(f);
    findFunds.refresh();
    favoriteFunds.refresh();

    loadFundsAssetsStructure();
    loadFundsBranchStructure();
  }

  isFavoriteFund(Fund f) {

    if (favoriteFunds.value.isEmpty) {
      return false;
    }

    return favoriteFunds.value.firstWhere(
            (el) => el.id == f.id, orElse: () => null
    ) != null ? true : false;
  }

  selectFund(id) {
    var data = allFunds.where((e) => (e.id == id));

    if (data.length > 0) {
      selectedFund.value = data.first;

      // Загрузка графика СЧА
      navItems.clear();
      loadNav();
      loadFundStructureByFundId();

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


  // OLD
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
  var selectedMoreItems = <Map>[].obs;
  var selectedFundId = 0.obs;
  var assetsFund = <FundStructure>[].obs;
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





  selectNav(value) {
    selectedNavPeriod.value = navPeriod.firstWhere((e) => (e.value == value));
    loadNav();
  }

  selectAssetsPeriod(value, fundId) {
    selectedAssetsPeriod.value = assetsPeriod.firstWhere((e) => (e.value == value));
    loadFundStructureByFundId();
  }

  selectHomePeriod(value) {
    selectedHomeDatePeriod.value = homeDatePeriod.firstWhere((e) => (e.value == value));
    loadFundsBranchStructure();
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


  filterFundsByKeywords(value) {

    if (value == "") {
      findFunds.assignAll(allFunds.value);
    }

    searchFundsKeyword.value = value;
    findFunds.assignAll(
        allFunds.value.where((element) => element.nameRus.toString().toUpperCase().indexOf(
            value.toString().toUpperCase()
        ) >= 0)
    );
  }


  deleteFavoriteFund(Fund f) {
    favoriteFunds.value.remove(f);
    findFunds.refresh();
    favoriteFunds.refresh();
  }


}
