import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/assets.dart';
import 'package:radar/routes/routes.dart';

class FundAssetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AssetsController c = Get.find<AssetsController>();

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
              itemCount: c.findAssets.length,
              itemBuilder: (context, index) {
                final item = c.findAssets[index];
                return FundAssetsListItem(
                  item.name,
                  0,
                  item.percent,
                  item.amount,
                );
              },
            ))
    );
  }
}

class FundAssetsListItem extends StatelessWidget {
  final String text;
  final double percent;
  final double amount;
  final int id;

  FundAssetsListItem(
      this.text, this.id, this.percent, this.amount);

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
            onTap: () => {Get.toNamed(Routes.asset, arguments: { "title": text, "id": id})},
            title: Text(text,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 14)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(percent.toString() + "%",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text(amount.toString() + " руб",
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),

        )
      ]),
    );
  }
}
