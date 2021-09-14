import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/fund_profit.dart';
import 'package:radar/pages/funds/widgets/list_fund_assets.dart';
import 'package:radar/pages/funds/widgets/list_fund_more.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';
import 'package:radar/pages/home/widgets/fund_structure.dart';
import 'package:radar/pages/home/widgets/list_fuds_state.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/second_header.dart';

class FundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundController c = Get.find<FundController>();

    if (Get.arguments["id"] != null) {
      c.selectFund(Get.arguments["id"]);
      c.loadFundStructureByFundId();
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

                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: SecondHeader("Ценные бумаги"),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Obx(() => Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: c.fundsAssetsStructure.map((e) {
                            return FundStructureItem(e.percent, e.diffPercent, e.amount, e.diffAmount, c.getLabelTypeByValue(e.type), color: e.color);
                          }).toList()
                      )),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: SecondHeader("Отрасли"),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListFundState(),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                      child: SecondHeader("Динамика стоимости чистых активов"),
                    ),

                    Container(
                      padding: const EdgeInsets.only(left: 5, top: 15, bottom: 15, right: 5),
                      child: PriceAssets()
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 0, top: 10),
                  child: Column(
                    children: [
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
