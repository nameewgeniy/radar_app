import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/screens/funds/widgets/list_funds.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/input/primary.dart';

class FundsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

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
            PrimaryInput( "Поиск", (value) => { c.filterFundsByKeywords(value) } ),
            Expanded(
              child: FundsList(),
            )
          ]),
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
