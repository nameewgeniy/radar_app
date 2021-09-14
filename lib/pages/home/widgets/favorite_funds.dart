import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/routes/routes.dart';

class FavoriteFunds extends StatelessWidget {

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
          itemCount: c.favoriteFunds.length,
          itemBuilder: (context, index) => FavoriteFundItem(
              c.allFunds[index].nameRus,
              c.allFunds[index].id,
              c.allFunds[index].fundsObjectNameRus)
      ),
    );
  }
}


class FavoriteFundItem extends StatelessWidget {
  final String text;
  final int fundId;
  final String subtext;

  FavoriteFundItem(this.text, this.fundId, this.subtext);

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