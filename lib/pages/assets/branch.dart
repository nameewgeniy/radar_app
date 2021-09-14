import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/pages/assets/widgets/assets_by_branch.dart';
import 'package:radar/widgets/bottom_bar.dart';

class AssetsBranch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final arg = Get.arguments;

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text( arg['title'] ?? "Отрасль активов"),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: AssetsByBranch()
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }

}