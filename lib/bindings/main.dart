import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:radar/main.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
