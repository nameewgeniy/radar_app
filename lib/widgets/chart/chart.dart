import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class PieOutsideLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate});

  factory PieOutsideLabelChart.withSampleData() {
    return new PieOutsideLabelChart(
      _prepareData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        child: new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 150,
            arcRendererDecorators: [new charts.ArcLabelDecorator()])
      )
    ));
  }

 static List<charts.Series<LinearItem, int>> _prepareData() {

    final MainController c = Get.find<MainController>();

    final data = c.fundsStateList.map((element) => new LinearItem(element.percent, element.percent.toInt(), element.title)).toList();

    return [
      new charts.Series<LinearItem, int>(
        id: 'Sales',
        domainFn: (LinearItem item, _) => item.percent.toInt(),
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