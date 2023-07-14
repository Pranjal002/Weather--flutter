import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  final List<DataPoint> dataPoints1;
  final List<DataPoint> dataPoints2;

  LineChartWidget({required this.dataPoints1, required this.dataPoints2});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        LineSeries<DataPoint, String>(
          dataSource: dataPoints1,
          xValueMapper: (DataPoint data, _) => data.x,
          yValueMapper: (DataPoint data, _) => data.y,
        ),
        LineSeries<DataPoint, String>(
          dataSource: dataPoints2,
          xValueMapper: (DataPoint data, _) => data.x,
          yValueMapper: (DataPoint data, _) => data.y,
        ),
      ],
    );
  }
}

class DataPoint {
  final String x;
  final double y;

  DataPoint({required this.x, required this.y});
}
