import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/screens/screens.dart';
import 'package:radar/routes/routes.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('app');

  runApp(GetMaterialApp(
    getPages: Screens.screens,
    initialRoute: Routes.initial,
    theme: ThemeData(
      primaryColor: Enum.firstColor,
    ),
  ));

  box.close();
}
