import 'package:get/get.dart';
import 'package:radar/models/AssetsStructure.dart';

class AssetsController extends GetxController {

  var assetsByType = <AssetsStructure>[
    new AssetsStructure(amount: 1450, name: "Test", diffAmount: 12, diffPercent: 23, percent: 60)
  ].obs;

}
