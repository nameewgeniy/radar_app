import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:radar/enum/enum.dart';
import 'package:radar/main.dart';
import 'package:radar/pages/pages.dart';
import 'package:radar/routes/routes.dart';

class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / Pages.pages.length;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          BottomBarItem(
              MaterialCommunityIcons.home_variant, "Главная", width, Routes.initial
          ),
          BottomBarItem(
              MaterialCommunityIcons.account_outline, "Акции", width, Routes.assets
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
          //Api().get(method: "https://localhost/funds?page=1");
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