import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/chart/chart.dart';
import 'package:radar/widgets/chart/circulars.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/group_buttons.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/widgets/list_fuds_state.dart';

class HomePage extends StatelessWidget {
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
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:20, top: 20, bottom: 10, right: 0),
              child: GroupButtons(),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20, top: 5, bottom: 5, right: 0),
                    child: HeaderTitle(
                      text: "Ценные бумаги",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
                    child: Circulars(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20, top: 5, bottom: 5, right: 0),
                    child: HeaderTitle(
                      text: "Отрасли",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20, top: 5, bottom: 0, right: 20),
                    child: ListFundState(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                        height: 500, child: PieOutsideLabelChart.withSampleData()),
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
