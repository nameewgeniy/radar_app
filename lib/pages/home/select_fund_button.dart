import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/controllers/funds.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/routes/routes.dart';

class SelectFundButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final FundController c = Get.find<FundController>();

    return Container(
      height: 45,
      width: double.infinity,
      margin: const EdgeInsets.only(left:10, top: 10, bottom: 5, right:10),
      decoration: BoxDecoration(
        //color: Color.fromARGB(255, 39, 49, 71),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Enum.firstColor)
      ),
      child: TextButton(
        child: Obx(
                () => Text("ИЗБРАННЫЕ ФОНДЫ (" + c.favoriteFunds.length.toString() + ")", style: TextStyle(color: Enum.firstColor, fontSize: 12))
        ),
        onPressed: () => { Get.toNamed(Routes.select_funds) },
      ),
    );
  }

}