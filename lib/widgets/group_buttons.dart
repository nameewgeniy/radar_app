import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class GroupButtons extends StatelessWidget {
  final MainController c = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)
        ),
        color: Color.fromARGB(255, 245, 247, 250),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "Месяц",
                  active: c.currentDateIndex.value == 1 ? true : false,
                  onPressed: () {
                    c.selectedDate(1);
                  },
                )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "3 месяца",
                  active: c.currentDateIndex.value == 2 ? true : false,
                  onPressed: () {
                    c.selectedDate(2);
                  },
                )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "6 месяцев",
                  active: c.currentDateIndex.value == 3 ? true : false,
                  onPressed: () {
                    c.selectedDate(3);
                  },
                )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "С начала года",
                  active: c.currentDateIndex.value == 4 ? true : false,
                  onPressed: () {
                    c.selectedDate(4);
                  },
                )),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "Год",
                  active: c.currentDateIndex.value == 5 ? true : false,
                  onPressed: () {
                    c.selectedDate(5);
                  },
                )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "3 года",
                  active: c.currentDateIndex.value == 6 ? true : false,
                  onPressed: () {
                    c.selectedDate(6);
                  },
                )),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Obx(() => DateButton(
                  text: "За всё время",
                  active: c.currentDateIndex.value == 7 ? true : false,
                  onPressed: () {
                    c.selectedDate(7);
                  },
                )),
              )
            ],
          ),
        ),
      ),
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
    return !active ? FlatButton(
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
