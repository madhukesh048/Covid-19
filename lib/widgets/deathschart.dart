import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DeathChart extends StatelessWidget {
  final List<TimeSeriesDeathCases> dataList;
  final String title;
  const DeathChart({
    @required this.dataList,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var data = dataList;
    var series = [
      new charts.Series<TimeSeriesDeathCases, DateTime>(
        id: 'Cases',
        displayName: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesDeathCases cases, _) => cases.time,
        measureFn: (TimeSeriesDeathCases cases, _) => cases.cases,
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

class TimeSeriesDeathCases {
  final DateTime time;
  final int cases;
  TimeSeriesDeathCases(this.time, this.cases);
}
