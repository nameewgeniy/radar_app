import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/input/primary.dart';
import 'package:radar/widgets/structure_list.dart';

class FundTypeAssetsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final arg = Get.arguments;
    final FundController c = Get.find<FundController>();
    c.selectAssetsTypeFund(arg['type'], arg['id']);

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text(arg['title'] ?? "Тип активов"),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                PrimaryInput( "Поиск", (value) => { c.setKeywordFundTypeAssets(value) } ),
                Expanded(child: Obx(() => AssetsList(c.findFundTypeAssets))),
              ],
            ),
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}