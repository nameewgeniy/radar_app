import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesChart extends StatelessWidget {
  final List<GraphRow> seriesList;
  final bool animate;

  TimeSeriesChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new charts.TimeSeriesChart(
        _prepareData(seriesList),
        animate: animate,
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                dataIsInWholeNumbers: true,
                desiredTickCount: 5)
        ),
      ),
    );
  }

  static List<charts.Series<GraphRow, DateTime>> _prepareData(List<GraphRow> data) {
    return [
      new charts.Series<GraphRow, DateTime>(
        id: 'Headcount',
        domainFn: (GraphRow row, _) => row.timeStamp,
        measureFn: (GraphRow row, _) => row.headcount,
        data: data,
      )
    ];
  }
}

class GraphRow {
  final DateTime timeStamp;
  final int headcount;
  GraphRow(this.timeStamp, this.headcount);
}
