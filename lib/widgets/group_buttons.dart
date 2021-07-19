import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/funds/widgets/price_assets.dart';

class GroupButtons extends StatelessWidget {
  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: c.homeDatePeriod
              .map((e) => Container(
              child: BorderButton(
                  text: e.label,
                  onPressed: () =>
                  {c.selectHomePeriod(e.value)},
                  isActive: e.value ==
                      c.selectedHomeDatePeriod.value.value),
              margin: const EdgeInsets.only(right: 5)))
              .toList())),
    );
  }
}

class DateButton extends StatelessWidget {

  final Function() onPressed;
  final String text;
  final Color color;
  final Color background;
  final bool active;

  DateButton({this.onPressed, this.text, this.color, this.background, this.active});

  @override
  Widget build(BuildContext context) {
    return !active ? TextButton(
      onPressed: onPressed,
      child: Text(text),
    ) : ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: background ?? Color.fromARGB(255, 245, 217, 214),
        onPrimary: color ?? Color.fromARGB(255, 210, 72, 56),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
        ),
      ),

      child: Text(text),
    );
  }
}
