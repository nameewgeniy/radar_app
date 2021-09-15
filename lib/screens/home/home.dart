import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/screens/home/widgets/favorite_funds.dart';
import 'package:radar/screens/home/widgets/fund_structure.dart';
import 'package:radar/screens/home/widgets/select_fund_button.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/screens/home/widgets/list_fuds_state.dart';

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
         /*   Padding(
              padding: const EdgeInsets.only(left:5, top: 10),
              child: GroupButtons(),
            ),*/
            Expanded(
              child: ListView(
                children: [
                  SelectFundButton(),
                  Padding(
                    padding: const EdgeInsets.only(left:10, top: 10, bottom: 15),
                    child: HeaderTitle(
                      text: "Ценные бумаги",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: FundsStructureWidget(),
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
                      text: "Избранные фонды",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                        color: Colors.white,
                        child: Column(children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                              maxHeight: 330,
                            ),
                            child: FavoriteFunds(),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () => {Get.toNamed(Routes.select_funds)},
                              child: Text("Изменить выбор"),
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
