import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/assets.dart';
import 'package:radar/screens/funds/widgets/list_fund_assets.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/input/primary.dart';

class AssetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AssetsController c = Get.find<AssetsController>();

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Фонд-радар"),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Column(
                children: [
                  PrimaryInput( "Поиск", (value) => { c.filterAssetsByKeywords(value) } ),
                  Expanded(child: FundAssetsList()),
                ],
              ))
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
