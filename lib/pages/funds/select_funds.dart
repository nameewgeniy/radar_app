import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/main.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/input/primary.dart';

class SelectFundsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final MainController c = Get.find<MainController>();

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Выберите фонд"),
            centerTitle: false,
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                PrimaryInput("Поиск", (value) => { c.filterFundsByKeywords(value) }),
                Expanded(child: SelectFundsList()),
              ],
            )
          ),
          bottomNavigationBar: BottomBar(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class SelectFundsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find<MainController>();

    return Obx(() => Conditional.single(
      context: context,
      conditionBuilder: (context) => c.searchFundsKeyword.isNotEmpty,
      widgetBuilder: (context) =>  Conditional.single(
        context: context,
        conditionBuilder: (context) => c.findFunds.length > 0,
        widgetBuilder: (context) => ListView(
            children: c.findFunds.map((e) => SelectFundsListItem(
                e["name_rus"], e["ID"], e["funds_object_name_rus"]))
                .toList()
        ),
        fallbackBuilder: (context) => Text("Не найдено ни одного фонда"),
      ),
      fallbackBuilder: (context) => ListView(
          children: c.allFunds.map((e) => SelectFundsListItem(
              e["name_rus"], e["ID"], e["funds_object_name_rus"]))
              .toList()
      ),
    ));
  }
}

class SelectFundsListItem extends StatelessWidget {
  final String text;
  final int fundId;
  final String subtext;

  SelectFundsListItem(this.text, this.fundId, this.subtext);

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
            onTap: () => { },
            title: Text(text, style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 14
            )),
            leading: CircleAvatar(
              backgroundColor: Enum.firstColor,
              child: const Icon(Icons.check, color: Colors.white),
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Text(text.substring(0, 2).toUpperCase()),
            ),
          ),
        )
      ]),
    );
  }
}