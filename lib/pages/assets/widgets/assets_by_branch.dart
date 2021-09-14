import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/assets.dart';

class AssetsByBranch extends StatelessWidget {
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
              itemCount: c.assetsByBranch.length,
              itemBuilder: (context, index) {
                final item = c.assetsByBranch[index];
                return AssetsByBranchItem(
                  item.name,
                  0,
                  item.percent,
                  item.diffPercent,
                );
              },
            )));
  }
}

class AssetsByBranchItem extends StatelessWidget {
  final String text;
  final double currentPercent;
  final double diffPercent;
  final int id;

  AssetsByBranchItem(this.text, this.id, this.currentPercent, this.diffPercent);

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
                    fontSize: 14)
            ),
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
