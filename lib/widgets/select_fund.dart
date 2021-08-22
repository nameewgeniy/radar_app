import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';

class SelectFund extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

    return Column(
      children: [
        Obx(() => TextButton(
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

    final FundController c = Get.find<FundController>();

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
        children: c.allFunds.map((e) => SelectFundListItem(e.fundsCompNameRus, e.id)).toList(),
      )),
    );
  }
}


class SelectFundListItem extends StatelessWidget {

  final String text;
  final int fundId;

  SelectFundListItem(this.text, this.fundId);

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

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
                c.selectFund(fundId),
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

