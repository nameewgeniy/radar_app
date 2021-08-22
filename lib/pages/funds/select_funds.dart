import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/models/Fund.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/input/primary.dart';

class SelectFundsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

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
    final FundController c = Get.find<FundController>();

    return Obx(() => Conditional.single(
          context: context,
          conditionBuilder: (context) => c.findFunds.length == 0,
          widgetBuilder: (context) => Text("Не найдено ни одного фонда"),
          fallbackBuilder: (context) => ListView(
              children: c.findFunds
                  .map((fund) => SelectFundsListItem(fund))
                  .toList()),
        ));
  }
}

class SelectFundsListItem extends StatelessWidget {
  final Fund fund;

  SelectFundsListItem(this.fund);

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        Material(
          type: MaterialType.card,
          child: ListTile(
            onTap: () => { c.isFavoriteFund(fund) ? c.deleteFavoriteFund(fund) : c.addFavoriteFund(fund)  },
            title: Text(fund.nameRus, style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
                fontSize: 14
            )),
            leading: CircleAvatar(
              backgroundColor: c.isFavoriteFund(fund) ? Enum.firstColor : Colors.grey,
              child: const Icon(Icons.check, color: Colors.white),
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Text(fund.nameRus.substring(0, 2).toUpperCase()),
            ),
          ),
        )
      ]),
    );
  }
}