part of core_view;

class _IndiaHomeMobile extends StatelessWidget {
  final IndiaHomeViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _IndiaHomeMobile(this.viewModel);

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
                Tab(text: 'Statewise'),
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
                        title: Text(
                          viewModel.indiaDataUnOff.data.statewise
                              .elementAt(index)
                              .state,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total: ' +
                                  viewModel.indiaDataUnOff.data.statewise
                                      .elementAt(index)
                                      .confirmed
                                      .toString(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
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
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Active: ' +
                        (viewModel.indiaDataUnOff.data.total.active.toString()),
                    style: TextStyle(fontSize: 20, color: Colors.blue[300]),
                  ),
                  Text(
                    'Recovered: ' +
                        (viewModel.indiaDataUnOff.data.total.recovered)
                            .toString(),
                    style: TextStyle(fontSize: 20, color: Colors.green[400]),
                  ),
                  Text(
                    'Deaths: ' +
                        (viewModel.indiaDataUnOff.data.total.deaths).toString(),
                    style: TextStyle(fontSize: 20, color: Colors.red[400]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Data Source: covid19india.org',
                    style: TextStyle(
                        fontSize: 18,
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
                        fontSize: 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  PieChart(
                    dataMap: dataMap,
                    colorList: colorList,
                    legendPosition: LegendPosition.bottom,
                    chartRadius: 300,
                    showChartValuesInPercentage: true,
                    showChartValues: false,
                    showChartValueLabel: false,
                    showChartValuesOutside: false,
                    showLegends: false,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
