import 'package:get/get.dart';
import 'package:radar/api/api.dart';
import 'package:radar/models/Assets.dart';
import 'package:radar/models/AssetsStructure.dart';
import 'package:radar/models/BranchStructure.dart';

class AssetsController extends GetxController {

  var allAssets = [].obs;
  var findAssets = [].obs;
  var searchAssetsKeyword = "".obs;

  var assetsByType = <AssetsStructure>[
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60),
  ].obs;

  var assetsByBranch = <BranchStructure>[
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
    new BranchStructure(amount: 1450, name: "Branch", diffAmount: 12, diffPercent: 23, percent: 60),
  ].obs;

  AssetsController() {
    loadAssets();
  }

  loadAssets() async {
    var items = await Api().fetchAssetsAll();

    allAssets.clear();
    if (items != null) {
      items.forEach((element) => allAssets.add(Assets.fromMap(element)));
    }

    findAssets.assignAll(allAssets.value);
  }

  filterAssetsByKeywords(value) {

    if (value == "") {
      findAssets.assignAll(allAssets.value);
    }

    searchAssetsKeyword.value = value;
    findAssets.assignAll(
        allAssets.value.where((element) => element.name.toString().toUpperCase().indexOf(
            value.toString().toUpperCase()
        ) >= 0)
    );
  }
}
