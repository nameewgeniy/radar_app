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
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  background: Color.fromARGB(255, 245, 217, 214),
                  color: Color.fromARGB(255, 210, 72, 56),
                  text: "Месяц",
                  active: true,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "3 месяца",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "6 месяцев",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "С начала года",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "Год",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "3 года",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: DateButton(
                  text: "За всё время",
                  active: false,
                  onPressed: () {
                    // Respond to button press
                  },
                ),
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
        primary: background ?? Colors.black54,
        onPrimary: color ?? Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
        ),
      ),

      child: Text(text),
    );
  }
}
