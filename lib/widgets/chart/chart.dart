import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar/main.dart';

class GaugeChart extends StatelessWidget {
  final bool animate;

  GaugeChart({this.animate});

  @override
  Widget build(BuildContext context) {

    return new charts.PieChart(_prepareDate(),
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 20,
            startAngle: 4 / 5 * 3.14,
            arcLength: 7 / 5 * 3.14
        )
    );
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<GaugeSegment, String>> _prepareDate() {

    final c = Get.find<MainController>();

    var data = c.fundsStructure.map((e) {
      return GaugeSegment(c.getLabelTypeByValue(e.type), (e.percent * 1000).toInt(), charts.Color(g: e.color.green, b: e.color.blue, r: e.color.red));
    }).toList();

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        colorFn: (GaugeSegment segment, _) => segment.color,
        data: data,
        labelAccessorFn: (GaugeSegment segment, _) => segment.segment
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;
  final charts.Color color;

  GaugeSegment(this.segment, this.size, this.color);
}