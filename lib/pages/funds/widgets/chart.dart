import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';
import 'package:radar/models/Nav.dart';
import 'package:intl/intl.dart';

class TimeSeriesChart extends StatelessWidget {

  final List<Nav> seriesList;
  final bool animate;

  List<GraphRow> items;

  TimeSeriesChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MainController>();

    final currencyFormatter = new charts.BasicNumericTickFormatterSpec.fromNumberFormat(
        new NumberFormat.compactCurrency(locale: "ru_RU", symbol: '₽')
    );

    return Container(
      child: new charts.TimeSeriesChart(
        prepareData(seriesList),
        animate: animate,
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                dataIsInWholeNumbers: true,
                desiredTickCount: 10
            ),
            tickFormatterSpec: currencyFormatter,
        ),
        domainAxis: new charts.DateTimeAxisSpec(
          tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
              year: new charts.TimeFormatterSpec(
            format: 'MM-dd-yyyy',
            transitionFormat: 'yyyy',
          )),
          showAxisLine: true,
        ),
      ),
    );
  }

  List<charts.Series<GraphRow, DateTime>> prepareData(List<Nav> data) {

    var items = data.map((e) {
      return new GraphRow(e.date, e.lastNav);
    }).toList();

    final oCcy = new NumberFormat("#,##0", "ru_RU");

    return [
      new charts.Series<GraphRow, DateTime>(
        id: 'Headcount',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (GraphRow row, _) => row.timeStamp,
        measureFn: (GraphRow row, _) => row.headcount,
        data: items,
      )
    ];
  }
}

class GraphRow {
  final DateTime timeStamp;
  final double headcount;
  GraphRow(this.timeStamp, this.headcount);
}
