import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/widgets/list_fuds_state.dart';

class FundAssetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find<MainController>();

    return Container(
        child: Obx(() => ListView.separated(
              separatorBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              itemCount: c.assetsFund.length,
              itemBuilder: (context, index) {
                final item = c.assetsFund[index];
                return FundAssetsListItem(
                  item["report_name"],
                  item["ID"],
                  item["share"],
                  Random().nextInt(100).toString(),
                );
              },
            )));
  }
}

class FundAssetsListItem extends StatelessWidget {
  final String text;
  final String currentPercent;
  final String deltaPercent;
  final int id;

  FundAssetsListItem(
      this.text, this.id, this.currentPercent, this.deltaPercent);

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
            onTap: () => {},
            title: Text(text,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(currentPercent + "%",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(deltaPercent + "%",
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
