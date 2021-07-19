import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/list_funds.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/second_header.dart';
import 'package:radar/widgets/select_fund.dart';

class FundsPage extends StatelessWidget {
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
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: SecondHeader("Все фонды")),
            ),
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
