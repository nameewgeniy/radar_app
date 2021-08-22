import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';

class FundAssetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundController c = Get.find<FundController>();

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
                  item.name,
                  0,
                  item.percent,
                  item.diffPercent,
                );
              },
            )));
  }
}

class FundAssetsListItem extends StatelessWidget {
  final String text;
  final double currentPercent;
  final double diffPercent;
  final int id;

  FundAssetsListItem(
      this.text, this.id, this.currentPercent, this.diffPercent);

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
                Text(currentPercent.toString() + "%",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(diffPercent.toString() + "%",
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
