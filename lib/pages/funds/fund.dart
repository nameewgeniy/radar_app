import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/fund_profit.dart';
import 'package:radar/pages/funds/widgets/list_fund_assets.dart';
import 'package:radar/pages/funds/widgets/list_fund_more.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/second_header.dart';

class FundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find<MainController>();

    if (Get.arguments["id"] != null) {
      c.selectFund(Get.arguments["id"]);
      c.loadAssetsByFundId(Get.arguments["id"]);
    }

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(
                  c.selectedFund.value.nameRus != null
                      ? c.selectedFund.value.nameRus
                      : "Выберите фонд",
                  style: TextStyle(
                    fontSize: 16
                  ),
                )),
            centerTitle: false,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 1,
              tabs: [
                Tab(
                  text: "Обзор",
                ),
                Tab(
                  text: "Активы",
                )
              ],
            ),
          ),
          body: Container(
            color: Colors.white,
            child: TabBarView(children: <Widget>[
              Container(
                child: ListView(
                  children: [

                    if (c.selectedFund.value.moreRus != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Container(child: Text(c.selectedFund.value.moreRus ?? "Описание фонда")),
                      ),

                    Container(
                      child: FundMoreList(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SecondHeader("Доходность фонда")),
                    ),

                    Container(
                      color: Colors.grey.shade100,
                      padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                      child: FundProfit(),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: SecondHeader("Динамика стоимости чистых активов"),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 5, top: 15, bottom: 15, right: 5),
                      child: PriceAssets()),
                  ],
                ),
              ),
              Padding(
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
            ]),
          ),
          bottomNavigationBar: BottomBar(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
