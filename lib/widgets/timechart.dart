import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeChart extends StatelessWidget {
  final List<TimeSeriesCases> dataList;
  final String title;
  const TimeChart({
    @required this.dataList,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var data = dataList;
    var series = [
      new charts.Series<TimeSeriesCases, DateTime>(
        id: 'Cases',
        displayName: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesCases cases, _) => cases.time,
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: data,
      )
    ];
    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      domainAxis: charts.EndPointsTimeAxisSpec(),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      defaultRenderer: new charts.BarRendererConfig<DateTime>(),
    );
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,style: TextStyle(fontSize:20,fontWeight: FontWeight.w600),),
        chartWidget,
      ],
    );
  }
}

class TimeSeriesCases {
  final DateTime time;
  final int cases;
  TimeSeriesCases(this.time, this.cases);
}
