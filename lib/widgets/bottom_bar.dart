import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radar/models/data.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationData = Provider.of<Data>(context);
    final width = MediaQuery.of(context).size.width / navigationData.navigationItems.length;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: navigationData.navigationItems.map((element) {
          return BottomBarItem(
            element["icon"],
            element["label"],
            width,
            element["route"]
          );
        }).toList()
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

    final navigationData = Provider.of<Data>(context);

    return Container(
      width: width,
      height: double.infinity,
      child: FlatButton(
        onPressed: () {
          navigationData.changePage(context, route);
          return true;
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  icon,
                  color: navigationData.currentRoute == route ? Data.firstColor : color,
                  size: 25
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: navigationData.currentRoute == route ? Data.firstColor : color
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

}