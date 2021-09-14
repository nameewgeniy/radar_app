import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/assets.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/list_fund_assets.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:radar/widgets/select_fund.dart';

class AssetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AssetsController c = Get.find<AssetsController>();
    final arg = Get.arguments;

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text(arg["title"] ?? "Фонд-радар"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Список фондов, в которых состоит актив в % соостношении в каждом фонде"),
                  ),
                  Divider(),
                ],
              ))
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
