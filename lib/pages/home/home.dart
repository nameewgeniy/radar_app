import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/chart/chart.dart';
import 'package:radar/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  height: 500,
                  child: PieOutsideLabelChart.withSampleData()
              ),
            )
          ]),
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
