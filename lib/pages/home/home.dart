import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/pages/funds/widgets/list_funds.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/chart/fund_structure.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/group_buttons.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/widgets/list_fuds_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:5, top: 10),
              child: GroupButtons(),
            ),
            TextButton(
              child: Text("Выбрать фонды"),
              onPressed: () => { Get.toNamed(Routes.select_funds) },
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10, top: 15, bottom: 15),
                    child: HeaderTitle(
                      text: "Ценные бумаги",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: FundStructure(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
                    child: HeaderTitle(
                      text: "Отрасли",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10, right: 20),
                    child: ListFundState(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10, top: 15, bottom: 15),
                    child: HeaderTitle(
                      text: "Фонды",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      color: Colors.white,
                      child: Column(children: <Widget>[
                        Container(
                          child: HomeFundsList(),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () => {Get.toNamed(Routes.funds)},
                            child: Text("Все фонды"),
                          ),
                        )
                      ])
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }


}
