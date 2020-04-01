part of core_view;

class _CoreMobile extends StatelessWidget {
  final CoreViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _CoreMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    viewModel.busy != true
        ? dataMap.putIfAbsent("Active",
            () => viewModel.indiaDataUnOff.data.total.active.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent("Recovered",
            () => viewModel.indiaDataUnOff.data.total.recovered.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent("Deaths",
            () => viewModel.indiaDataUnOff.data.total.deaths.toDouble())
        : Offstage();

    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('INDIA'),
            backgroundColor: Colors.black,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Stats'),
                Tab(text: 'StateWise'),
              ],
            ),
          ),
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                        child: Text(
                      'MENU',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      viewModel.goToIndiaHome();
                    },
                    title: Text(
                      "INDIA",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      viewModel.goToWorldHome();
                    },
                    title: Text(
                      "WORLD",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ListTile(
                    onTap: viewModel.goToWorldNews,
                    title: Text(
                      "NEWS",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     "HELP",
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [getStatsPage(), getStateWisePage()],
          )),
    ));
  }

  Widget getStateWisePage() {
    return viewModel.busy != true
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: viewModel.indiaDataUnOff.data.statewise.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      viewModel.goToStateDetailsPage(index);
                    },
                    child: Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(viewModel.indiaDataUnOff.data.statewise
                            .elementAt(index)
                            .state),
                        trailing: Icon(Icons.chevron_right),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Active: ' +
                                  viewModel.indiaDataUnOff.data.statewise
                                      .elementAt(index)
                                      .active
                                      .toString(),
                              style: TextStyle(
                                color: Colors.blue[300],
                              ),
                            ),
                            Text(
                              'Recovered: ' +
                                  viewModel.indiaDataUnOff.data.statewise
                                      .elementAt(index)
                                      .recovered
                                      .toString(),
                              style: TextStyle(
                                color: Colors.green[400],
                              ),
                            ),
                            Text(
                              'Deaths: ' +
                                  viewModel.indiaDataUnOff.data.statewise
                                      .elementAt(index)
                                      .deaths
                                      .toString(),
                              style: TextStyle(
                                color: Colors.red[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget getStatsPage() {
    var totalData = [
      TimeSeriesCases(DateTime(2020, 3, 1), 3),
      TimeSeriesCases(DateTime(2020, 3, 2), 5),
      TimeSeriesCases(DateTime(2020, 3, 3), 6),
      TimeSeriesCases(DateTime(2020, 3, 4), 28),
      TimeSeriesCases(DateTime(2020, 3, 5), 30),
      TimeSeriesCases(DateTime(2020, 3, 6), 31),
      TimeSeriesCases(DateTime(2020, 3, 7), 34),
      TimeSeriesCases(DateTime(2020, 3, 8), 39),
      TimeSeriesCases(DateTime(2020, 3, 9), 48),
      TimeSeriesCases(DateTime(2020, 3, 10), 63),
      TimeSeriesCases(DateTime(2020, 3, 11), 70),
      TimeSeriesCases(DateTime(2020, 3, 12), 82),
      TimeSeriesCases(DateTime(2020, 3, 13), 91),
      TimeSeriesCases(DateTime(2020, 3, 14), 107),
      TimeSeriesCases(DateTime(2020, 3, 15), 113),
      TimeSeriesCases(DateTime(2020, 3, 16), 127),
      TimeSeriesCases(DateTime(2020, 3, 17), 146),
      TimeSeriesCases(DateTime(2020, 3, 18), 171),
      TimeSeriesCases(DateTime(2020, 3, 19), 199),
      TimeSeriesCases(DateTime(2020, 3, 20), 258),
      TimeSeriesCases(DateTime(2020, 3, 21), 334),
      TimeSeriesCases(DateTime(2020, 3, 22), 403),
      TimeSeriesCases(DateTime(2020, 3, 23), 505),
      TimeSeriesCases(DateTime(2020, 3, 24), 571),
      TimeSeriesCases(DateTime(2020, 3, 25), 657),
      TimeSeriesCases(DateTime(2020, 3, 26), 735),
      TimeSeriesCases(DateTime(2020, 3, 27), 886),
      TimeSeriesCases(DateTime(2020, 3, 28), 1029),
      TimeSeriesCases(DateTime(2020, 3, 29), 1139),
      TimeSeriesCases(DateTime(2020, 3, 30), 1347),
      TimeSeriesCases(DateTime(2020, 3, 31), 1624),
      TimeSeriesCases(DateTime(2020, 4, 1), 1966),
    ];
    var dailyData = [
      TimeSeriesCases(DateTime(2020, 3, 1), 0),
      TimeSeriesCases(DateTime(2020, 3, 2), 2),
      TimeSeriesCases(DateTime(2020, 3, 3), 1),
      TimeSeriesCases(DateTime(2020, 3, 4), 22),
      TimeSeriesCases(DateTime(2020, 3, 5), 2),
      TimeSeriesCases(DateTime(2020, 3, 6), 1),
      TimeSeriesCases(DateTime(2020, 3, 7), 3),
      TimeSeriesCases(DateTime(2020, 3, 8), 5),
      TimeSeriesCases(DateTime(2020, 3, 9), 9),
      TimeSeriesCases(DateTime(2020, 3, 10), 15),
      TimeSeriesCases(DateTime(2020, 3, 11), 7),
      TimeSeriesCases(DateTime(2020, 3, 12), 12),
      TimeSeriesCases(DateTime(2020, 3, 13), 9),
      TimeSeriesCases(DateTime(2020, 3, 14), 16),
      TimeSeriesCases(DateTime(2020, 3, 15), 6),
      TimeSeriesCases(DateTime(2020, 3, 16), 14),
      TimeSeriesCases(DateTime(2020, 3, 17), 19),
      TimeSeriesCases(DateTime(2020, 3, 18), 25),
      TimeSeriesCases(DateTime(2020, 3, 19), 28),
      TimeSeriesCases(DateTime(2020, 3, 20), 59),
      TimeSeriesCases(DateTime(2020, 3, 21), 76),
      TimeSeriesCases(DateTime(2020, 3, 22), 69),
      TimeSeriesCases(DateTime(2020, 3, 23), 102),
      TimeSeriesCases(DateTime(2020, 3, 24), 66),
      TimeSeriesCases(DateTime(2020, 3, 25), 86),
      TimeSeriesCases(DateTime(2020, 3, 26), 78),
      TimeSeriesCases(DateTime(2020, 3, 27), 151),
      TimeSeriesCases(DateTime(2020, 3, 28), 143),
      TimeSeriesCases(DateTime(2020, 3, 29), 110),
      TimeSeriesCases(DateTime(2020, 3, 30), 208),
      TimeSeriesCases(DateTime(2020, 3, 31), 277),
      TimeSeriesCases(DateTime(2020, 4, 1), 331),
    ];
    var dailyRecovered = [
      TimeSeriesRecoverCases(DateTime(2020, 3, 1), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 2), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 3), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 4), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 5), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 6), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 7), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 8), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 9), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 10), 1),
      TimeSeriesRecoverCases(DateTime(2020, 3, 11), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 12), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 13), 6),
      TimeSeriesRecoverCases(DateTime(2020, 3, 14), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 15), 3),
      TimeSeriesRecoverCases(DateTime(2020, 3, 16), 1),
      TimeSeriesRecoverCases(DateTime(2020, 3, 17), 1),
      TimeSeriesRecoverCases(DateTime(2020, 3, 18), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 19), 5),
      TimeSeriesRecoverCases(DateTime(2020, 3, 20), 3),
      TimeSeriesRecoverCases(DateTime(2020, 3, 21), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 22), 0),
      TimeSeriesRecoverCases(DateTime(2020, 3, 23), 2),
      TimeSeriesRecoverCases(DateTime(2020, 3, 24), 15),
      TimeSeriesRecoverCases(DateTime(2020, 3, 25), 3),
      TimeSeriesRecoverCases(DateTime(2020, 3, 26), 7),
      TimeSeriesRecoverCases(DateTime(2020, 3, 27), 25),
      TimeSeriesRecoverCases(DateTime(2020, 3, 28), 10),
      TimeSeriesRecoverCases(DateTime(2020, 3, 29), 17),
      TimeSeriesRecoverCases(DateTime(2020, 3, 30), 35),
      TimeSeriesRecoverCases(DateTime(2020, 3, 31), 13),
      TimeSeriesRecoverCases(DateTime(2020, 4, 1), 18),
    ];
    var dailyDeaths = [
      TimeSeriesDeathCases(DateTime(2020, 3, 1), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 2), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 3), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 4), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 5), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 6), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 7), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 8), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 9), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 10), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 11), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 12), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 13), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 14), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 15), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 16), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 17), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 18), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 19), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 20), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 21), 0),
      TimeSeriesDeathCases(DateTime(2020, 3, 22), 3),
      TimeSeriesDeathCases(DateTime(2020, 3, 23), 2),
      TimeSeriesDeathCases(DateTime(2020, 3, 24), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 25), 1),
      TimeSeriesDeathCases(DateTime(2020, 3, 26), 5),
      TimeSeriesDeathCases(DateTime(2020, 3, 27), 3),
      TimeSeriesDeathCases(DateTime(2020, 3, 28), 5),
      TimeSeriesDeathCases(DateTime(2020, 3, 29), 3),
      TimeSeriesDeathCases(DateTime(2020, 3, 30), 16),
      TimeSeriesDeathCases(DateTime(2020, 3, 31), 6),
      TimeSeriesDeathCases(DateTime(2020, 4, 1), 6),
    ];
    return viewModel.busy != true
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Total Cases: ' +
                        (viewModel.indiaDataUnOff.data.total.confirmed
                            .toString()),
                    style: TextStyle(fontSize: 20),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Active: ' +
                        (viewModel.indiaDataUnOff.data.total.active.toString()),
                    style: TextStyle(fontSize: 16, color: Colors.blue[300]),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Recovered: ' +
                        (viewModel.indiaDataUnOff.data.total.recovered)
                            .toString(),
                    style: TextStyle(fontSize: 16, color: Colors.green[400]),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Deaths: ' +
                        (viewModel.indiaDataUnOff.data.total.deaths).toString(),
                    style: TextStyle(fontSize: 16, color: Colors.red[400]),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  Text(
                    'Data Source: covid19india.org',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Last Updated on: ' +
                        DateFormat('kk:mm:a dd-MM-yyyy')
                            .format(viewModel.indiaDataUnOff.lastOriginUpdate)
                            .toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  PieChart(
                    dataMap: dataMap,
                    colorList: colorList,
                    legendPosition: LegendPosition.bottom,
                    chartRadius: 200,
                    showChartValuesInPercentage: false,
                    showChartValues: false,
                    showChartValueLabel: false,
                    showChartValuesOutside: false,
                    showLegends: false,
                  ),
                  SizedBox(height: 10),

                  TimeChart(
                    dataList: totalData,
                    title: 'Daywise Total Cases Trend'.toUpperCase(),
                  ),
                  TimeChart(
                    dataList: dailyData,
                    title: "Daywise New Cases".toUpperCase(),
                  ),
                  RecoveredChart(
                    dataList: dailyRecovered,
                    title: 'Daywise Recovered Cases'.toUpperCase(),
                  ),
                  DeathChart(
                    dataList: dailyDeaths,
                    title: 'Daywise Deaths'.toUpperCase(),
                  )
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
