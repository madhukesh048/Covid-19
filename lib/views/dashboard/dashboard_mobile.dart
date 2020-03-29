part of dashboard_view;

class _DashboardMobile extends StatelessWidget {
  final DashboardViewModel viewModel;

  _DashboardMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORLD'),
        centerTitle: true,
        backgroundColor: Colors.black,
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
                  // viewModel.goToIndiaHome();
                },
                title: Text(
                  "INDIA",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  // viewModel.goToWorldHome();
                },
                title: Text(
                  "WORLD",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "NEWS",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "HELP",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      body: viewModel.busy != true
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total Cases: " +
                                  viewModel.worldData.cases.toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Active: " +
                                  viewModel.worldData.active.toString(),
                              style: TextStyle(
                                  fontSize: 22, color: Colors.blue[300]),
                            ),
                            Text(
                              "Recovered: " +
                                  viewModel.worldData.recovered.toString(),
                              style: TextStyle(
                                  fontSize: 22, color: Colors.green[400]),
                            ),
                            Text(
                              "Deaths: " +
                                  viewModel.worldData.deaths.toString(),
                              style: TextStyle(
                                  fontSize: 22, color: Colors.red[400]),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: PieChart(
                            dataMap: viewModel.dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 50.0,
                            chartRadius:
                                MediaQuery.of(context).size.width / 1.2,
                            colorList: viewModel.colorList,
                            decimalPlaces: 0,
                            initialAngle: 0,
                            showChartValuesInPercentage: true,
                            legendPosition: LegendPosition.bottom,
                            chartType: ChartType.disc,
                            showLegends: false,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: FlatButton(
                              color: Colors.grey[300],
                              onPressed: () {},
                              child: Text("SEE ALL AFFECTED COUNTRIES")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
