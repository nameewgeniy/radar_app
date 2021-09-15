import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/screens/screens.dart';
import 'package:radar/routes/routes.dart';

class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / 3;

    return Container(
      width: double.infinity,
      height: 50,
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
      child: Row(
        children: [
          BottomBarItem(
              MaterialCommunityIcons.home_variant, "Главная", width, Routes.initial
          ),
          BottomBarItem(
              MaterialCommunityIcons.chart_bar, "Фонды", width, Routes.funds
          ),
          BottomBarItem(
              MaterialCommunityIcons.chart_areaspline, "Активы", width, Routes.assets
          ),
        ]
      )
    );
  }

}

class BottomBarItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final Color color = Colors.grey[500];
  final double width;
  final String route;

  BottomBarItem(
      this.icon,
      this.label,
      this.width,
      this.route
  );

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: double.infinity,
      child: FlatButton(
        onPressed: () {
          Get.toNamed(route);
          return true;
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  icon,
                  color: Get.currentRoute == route ? Enum.firstColor : color,
                  size: 25
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Get.currentRoute == route ? Enum.firstColor : color
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

}