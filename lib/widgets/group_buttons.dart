import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class GroupButtons extends StatelessWidget {

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        color: Color.fromARGB(100, 224, 224, 224),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Месяц'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('3 месяца'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('6 месяцев'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('С начала года'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Год'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('3 года'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 10
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('За всё время'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



}