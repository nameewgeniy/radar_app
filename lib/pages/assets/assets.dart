import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/list_fund_assets.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/select_fund.dart';

class AssetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find<MainController>();

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
          child:Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: c.assetsPeriod
                            .map((e) => Container(
                            child: BorderButton(
                                text: e.label,
                                onPressed: () =>
                                {c.selectAssetsPeriod(e.value)},
                                isActive: e.value ==
                                    c.selectedAssetsPeriod.value.value),
                            margin: const EdgeInsets.only(right: 5)))
                            .toList())),
                  ),
                  Divider(),
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
