import 'package:get/get.dart';
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

  filterAssetsByKeywords(value) {

    if (value == "") {
      findAssets.assignAll(allAssets.value);
    }

    searchAssetsKeyword.value = value;
    findAssets.assignAll(
        allAssets.value.where((element) => element.nameRus.toString().toUpperCase().indexOf(
            value.toString().toUpperCase()
        ) >= 0)
    );
  }
}
