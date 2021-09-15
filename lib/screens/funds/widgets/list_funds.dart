import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/main.dart';
import 'package:radar/routes/routes.dart';
import 'package:radar/widgets/header_title.dart';
import 'package:radar/screens/home/widgets/list_fuds_state.dart';

class FundsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FundController c = Get.find<FundController>();

    return Obx(
          () => ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 70),
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
            itemCount: c.findFunds.length,
            itemBuilder: (context, index) => FundsListItem(
                c.findFunds[index].nameRus,
                c.findFunds[index].id,
                c.findFunds[index].fundsObjectNameRus)
          ),
    );
  }
}

class FundsListItem extends StatelessWidget {
  final String text;
  final int fundId;
  final String subtext;

  FundsListItem(this.text, this.fundId, this.subtext);

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
