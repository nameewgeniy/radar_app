import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/widgets/list_fuds_state.dart';

class SelectFund extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final MainController c = Get.find<MainController>();

    return Column(
      children: [
        Obx(() => FlatButton(
          onPressed: () { Get.bottomSheet(SelectFundList()); },
          child: Text("${c.selectedFund}"),
        )),
      ],
    );
  }
}


class SelectFundList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final MainController c = Get.find<MainController>();

    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Obx(() => ListView(
        children: c.allFunds.map((e) => SelectFundListItem(e["funds_comp_name_rus"], e["id"])).toList(),
      )),
    );
  }
}


class SelectFundListItem extends StatelessWidget {

  final String text;
  final String fund_id;

  SelectFundListItem(this.text, this.fund_id);

  @override
  Widget build(BuildContext context) {

    final MainController c = Get.find<MainController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Material(
            type: MaterialType.card,
            child: ListTile(
              onTap: () => {
                c.selectFund(fund_id),
                Get.back()
              },
              title: Text(text, style: TextStyle(color: Colors.grey[600])),
            ),
          ),
          Divider()
        ]
      ),
    );
  }
}

