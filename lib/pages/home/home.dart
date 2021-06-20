import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radar/widgets/bottom_bar.dart';
import 'package:radar/widgets/chart/chart.dart';
import 'package:radar/widgets/custom_drawer.dart';
import 'package:charts_flutter/flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Scaffold(
        drawer: CustomDrawer(),
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.amberAccent,
          child: Column(children: <Widget>[
            PieOutsideLabelChart.withSampleData()
          ]),
        ),
        bottomNavigationBar: BottomBar(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
