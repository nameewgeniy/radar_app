import 'package:get/get.dart';
import 'package:radar/api/api.dart';
import 'package:radar/models/Assets.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/models/Nav.dart';
import 'package:radar/models/Period.dart';
import 'package:radar/models/StructureItem.dart';
import 'package:radar/widgets/chart/chart.dart';

class FundController extends GetxController {

  var allFunds = <Fund>[].obs;
  var findFunds = <Fund>[].obs;
  var favoriteFunds = <Fund>[].obs;

  // Структура избранных фондов по типу активов
  var fundsStructureByType = <StructureItem>[].obs;

  // Структура фонда по типу активов
  var fundStructureByType = <StructureItem>[].obs;

  // Список активов избранных фондов
  var fundsAssetsByType = <Assets>[].obs;

  // Список активов фонда по типу
  var fundAssetsByType = <Assets>[].obs;

  // Список активов фонда по отрасли
  var fundAssetsByBranch = <Assets>[].obs;

  // Список активов избранных фондов по отрасли
  var fundsAssetsByBranch = <Assets>[].obs;

  // Сумма стоимости всех активов по избранным активам
  var sumAmount = 0.0.obs;

  // Структура избранных фондов для графика
  var fundsStructureCharts = <GaugeSegment>[].obs;

  // Структура избранных фондов по отраслям
  var fundsStructureByBranch = <StructureItem>[].obs;

  // Структура фонда по отраслям
  var fundStructureByBranch = <StructureItem>[].obs;

  var keywordFundTypeAssets = "".obs;
  var keywordFundTypeBranch = "".obs;
  var keywordFundsTypeAssets = "".obs;
  var keywordFundsTypeBranch = "".obs;


  @override
  void onInit() {

    loadAllFunds();
    loadFundsAssetsStructure();
    loadFundsBranchStructure();

    super.onInit();
  }

  FundController() {}

  /// Загрузка структруы избранных фондов по типу актива
  loadFundsAssetsStructure() async {
    var response = await Api().fetchFundsStructureByType(favoriteFunds.value.map((e) => e.id).toList(), 6);

    fundsStructureByType.clear();
    sumAmount.value = 0.0;

    var i = 0;
    response.forEach((element) {
      var item = StructureItem.fromMap(element);

      item.color = StructureItem.structureColors[i++];

      fundsStructureByType.add(item);
      sumAmount.value += item.amount;
    });

    fundsStructureByType.value.map((element) => sumAmount.value += element.amount);
    fundsStructureByType.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка структуры фонда по типу активов
  loadFundAssetsStructure() async {
    if (selectedFund.value.fundId != null) {
      var response = await Api().fetchFundsStructureByType([selectedFund.value.fundId], 24);

      fundStructureByType.assignAll(
          structureItemsFromList(response)
      );

      fundStructureByType.value.sort((a, b) => b.percent.compareTo(a.percent));
    }
  }

  /// Загрузка активов фондов по типу аткива
  loadFundsAssetsByType(type) async {
    var response = await Api().fetchAssetsByType(type, favoriteFunds.value.map((e) => e.id).toList());

    fundsAssetsByType.clear();
    if (response != null) {
      response.forEach((element) => fundsAssetsByType.add(Assets.fromMap(element)));
    }

    fundsAssetsByType.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка активов фондА по типу аткива
  loadFundAssetsByType(type, fundId) async {
    var response = await Api().fetchAssetsByType(type, [fundId]);

    fundAssetsByType.clear();
    if (response != null) {
      response.forEach((element) => fundAssetsByType.add(Assets.fromMap(element)));
    }

    fundAssetsByType.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка активов фондА по отрасли
  loadFundAssetsByBranch(branch, fundId) async {
    var response = await Api().fetchAssetsByBranch(branch, [fundId]);

    fundAssetsByBranch.clear();
    if (response != null) {
      response.forEach((element) => fundAssetsByBranch.add(Assets.fromMap(element)));
    }

    fundAssetsByBranch.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка активов избранных фондов по отрасли
  loadFundsAssetsByBranch(branch) async {
    var response = await Api().fetchAssetsByBranch(branch, favoriteFunds.value.map((e) => e.id).toList());

    fundsAssetsByBranch.clear();
    if (response != null) {
      response.forEach((element) => fundsAssetsByBranch.add(Assets.fromMap(element)));
    }

    fundsAssetsByBranch.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка структуры избранных фондов по отраслям
  loadFundsBranchStructure() async {
    var response = await Api().fetchFundsStructureByBranch(favoriteFunds.value.map((e) => e.id).toList(), 6);
    fundsStructureByBranch.clear();
    response.forEach((element) =>
        fundsStructureByBranch.add(StructureItem.fromMap(element))
    );

    fundsStructureByBranch.value.sort((a, b) => b.percent.compareTo(a.percent));
  }

  /// Загрузка структуры фонда по отраслям
  loadFundBranchStructure() async {
    if (selectedFund.value.fundId != null) {

      fundStructureByBranch.clear();
      var response = await Api().fetchFundsStructureByBranch([selectedFund.value.fundId], 24);

      response.forEach((element) =>
          fundStructureByBranch.add(StructureItem.fromMap(element))
      );

      fundStructureByBranch.value.sort((a, b) => b.percent.compareTo(a.percent));
    }
  }

  /// Загрузка всех фондов
  loadAllFunds() async {
    var response = await Api().fetchFunds();

    allFunds.assignAll(response);
    findFunds.assignAll(response);
    favoriteFunds.assignAll(response);
  }

  ///
  addFavoriteFund(Fund f) {
    favoriteFunds.value.add(f);
    findFunds.refresh();
    favoriteFunds.refresh();

    loadFundsAssetsStructure();
    loadFundsBranchStructure();
  }

  deleteFavoriteFund(Fund f) {
    favoriteFunds.value.remove(f);
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
      loadFundAssetsStructure();
      loadFundBranchStructure();

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

  selectAssetsTypeFunds(type) {
    fundsAssetsByType.clear();
    loadFundsAssetsByType(type);
  }
  
  selectAssetsTypeFund(type, id) {
    fundAssetsByType.clear();
    loadFundAssetsByType(type, id);
  }

  selectAssetsBranchFunds(branch) {
    fundsAssetsByBranch.clear();
    loadFundsAssetsByBranch(branch);
  }

  selectAssetsBranchFund(branch, id) {
    fundAssetsByBranch.clear();
    loadFundAssetsByBranch(branch, id);
  }

  List<Assets> get findFundsTypeAssets {

    if (fundsAssetsByType.isNotEmpty) {
      return fundsAssetsByType.value.where((element) =>
        element.name.toString().toUpperCase().indexOf(
          keywordFundsTypeAssets.value.toUpperCase()
      ) >= 0).toList();
    }

    return fundsAssetsByType;
  }

  List<Assets> get findFundsTypeBranch {

    if (fundsAssetsByType.isNotEmpty) {
      return fundsAssetsByType.value.where((element) =>
      element.name.toString().toUpperCase().indexOf(
          keywordFundsTypeBranch.value.toUpperCase()
      ) >= 0).toList();
    }

    return fundsAssetsByType;
  }

  List<Assets> get findFundTypeBranch {

    if (fundAssetsByType.isNotEmpty) {
      return fundAssetsByType.value.where((element) =>
      element.name.toString().toUpperCase().indexOf(
          keywordFundTypeBranch.value.toUpperCase()
      ) >= 0).toList();
    }

    return fundAssetsByType;
  }

  List<Assets> get findFundTypeAssets {

    if (fundAssetsByType.isNotEmpty) {
      return fundAssetsByType.value.where((element) =>
      element.name.toString().toUpperCase().indexOf(
          keywordFundTypeAssets.value.toUpperCase()
      ) >= 0).toList();
    }

    return fundAssetsByType;
  }

  setKeywordFundsTypeAssets(String keyword) => keywordFundsTypeAssets.value = keyword;
  setKeywordFundsTypeBranch(String keyword) => keywordFundsTypeBranch.value = keyword;
  setKeywordFundTypeAssets(String keyword) => keywordFundTypeAssets.value = keyword;
  setKeywordFundTypeBranch(String keyword) => keywordFundTypeBranch.value = keyword;

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

  var fundsStructure = <StructureItem>[].obs;
  var selectedFund = Fund().obs;
  var selectedMoreItems = <Map>[].obs;
  var selectedFundId = 0.obs;
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
    loadFundAssetsStructure();
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
}
