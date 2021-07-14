import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelChart(this.seriesList, {this.animate});

  factory HorizontalBarLabelChart.withSampleData() {
    return new HorizontalBarLabelChart(
      _prepareData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          vertical: true,
          barRendererDecorator: new charts.BarLabelDecorator<String>(),
          primaryMeasureAxis: new charts.NumericAxisSpec(
              showAxisLine: false, renderSpec: new charts.NoneRenderSpec()),
          domainAxis: new charts.OrdinalAxisSpec(),
          defaultRenderer: new charts.BarRendererConfig(
              cornerStrategy: const charts.ConstCornerStrategy(30)),
        ));
  }

  static List<charts.Series<LinearItem, String>> _prepareData() {
    final MainController c = Get.find<MainController>();

    final data = c.fundsStateList
        .map((element) => new LinearItem(
            element.percent, element.percent.toInt(), element.title))
        .toList();

    return [
      new charts.Series<LinearItem, String>(
        id: 'Percent',
        domainFn: (LinearItem item, _) => item.percent.toString(),
        measureFn: (LinearItem item, _) => item.measure,
        data: data,
        labelAccessorFn: (LinearItem row, _) => '${row.percent.toInt()}%',
      )
    ];
  }
}

class LinearItem {
  final String title;
  final double percent;
  final int measure;

  LinearItem(this.percent, this.measure, this.title);
}
