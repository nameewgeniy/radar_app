import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/assets.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/screens/home/widgets/favorite_funds.dart';
import 'package:radar/widgets/bottom_bar.dart';

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
              child: AssetStructureFund())
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}


class AssetStructureFund extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();
    var rng = new Random();

    return Obx(
          () => ListView.separated(
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
          itemCount: c.allFunds.length,
          itemBuilder: (context, index) => FavoriteFundItem(
              c.allFunds[index].nameRus,
              c.allFunds[index].id,
              rng.nextInt(30).toString() + "%")
      ),
    );
  }
}


class AssetStructureFundItem extends StatelessWidget {
  final String text;
  final int fundId;
  final String subtext;

  AssetStructureFundItem(this.text, this.fundId, this.subtext);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        Material(
          type: MaterialType.card,
          child: ListTile(
            onTap: () => { Get.toNamed(Routes.fund, arguments: {'id': fundId}),},
            title: Text(text, style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 14
            )),
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Text(text.substring(0, 2).toUpperCase()),
            ),
            trailing: Text(subtext,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12)
            ),
          ),
        )
      ]),
    );
  }
}
