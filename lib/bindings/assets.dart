import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:radar/controllers/assets.dart';

class AssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssetsController());
  }
}
