import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/widgets/list_fuds_state.dart';

class FundMoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundController c = Get.find<FundController>();

    return Container(
        child: Obx(() => Column(
            children: c.selectedMoreItems
                .map((e) => FundMoreListItem(e["name"] + ": " + e["value"]))
                .toList()
        )
        ));
  }
}

class FundMoreListItem extends StatelessWidget {
  final String text;

  FundMoreListItem(this.text);

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
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
