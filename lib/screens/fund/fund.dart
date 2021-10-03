import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/screens/fund/widgets/fund_branch_structure.dart';
import 'package:radar/screens/fund/widgets/fund_more_list.dart';
import 'package:radar/screens/fund/widgets/fund_price_assets.dart';
import 'package:radar/screens/fund/widgets/fund_type_structure.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/second_header.dart';

class FundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundController c = Get.find<FundController>();

    if (Get.arguments["id"] != null) {
      c.selectFund(Get.arguments["id"]);
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
          ),
          body: Container(
            color: Colors.white,
            child: Container(
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
                    child: FundTypeStructure(),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: SecondHeader("Отрасли"),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: FundBranchStructure(),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: SecondHeader("Динамика стоимости чистых активов"),
                  ),

                  Container(
                      padding: const EdgeInsets.only(left: 5, top: 15, bottom: 15, right: 5),
                      child: FundPriceAssets()
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
