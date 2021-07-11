import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/pages/pages.dart';
import 'package:radar/routes/routes.dart';

void main() => runApp(GetMaterialApp(
  getPages: Pages.pages,
  initialRoute: Routes.initial,
));

class Controller extends GetxController{

  var isSelected = <bool>[false, false, false, false, false, false].obs;

  selectedDate(index) {
    isSelected.value[index] = !isSelected.value[index];
    update();
  }
}
