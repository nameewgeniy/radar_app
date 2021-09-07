import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/pages/assets/widgets/assets_by_type.dart';
import 'package:radar/widgets/bottom_bar.dart';

class AssetsType extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final arg = Get.arguments;

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text( arg['title'] ?? "Тип активов"),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: AssetsByType()
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}