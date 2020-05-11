part of home_view;

class _WorldHomeMobile extends StatelessWidget {
  final WorldHomeViewModel viewModel;

  _WorldHomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('WORLD'),
              centerTitle: true,
              backgroundColor: Colors.black,
              bottom:
                  TabBar(tabs: [Tab(text: 'Stats'), Tab(text: 'CountryWise')]),
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
                children: [getStatsPage(), getCountryWisePage()])),
      ),
    );
  }

  Widget getCountryWisePage() {
    return viewModel.countries != null
        ? ListView.builder(
            itemCount: viewModel.countries.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  viewModel.goToDetailsPage(i);
                },
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    trailing: Icon(Icons.chevron_right),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Confirmed: ' +
                              viewModel.countries.elementAt(i).cases.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          'Active: ' +
                              viewModel.countries
                                  .elementAt(i)
                                  .active
                                  .toString(),
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        Text(
                          'Deaths: ' +
                              viewModel.countries
                                  .elementAt(i)
                                  .deaths
                                  .toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    title: Text(
                      viewModel.countries.elementAt(i).country,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            })
        : Center(child: CircularProgressIndicator());
  }

  Widget getStatsPage() {
    return viewModel.worldData != null
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total Cases: ' + (viewModel.worldData.cases).toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Active: ' + (viewModel.worldData.active).toString(),
                    style: TextStyle(fontSize: 20, color: Colors.blue[300]),
                  ),
                  Text(
                    'Recovered: ' + (viewModel.worldData.recovered).toString(),
                    style: TextStyle(fontSize: 20, color: Colors.green[400]),
                  ),
                  Text(
                    'Deaths: ' + (viewModel.worldData.deaths).toString(),
                    style: TextStyle(fontSize: 20, color: Colors.red[400]),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                      'Last Updated on: ' +
                          DateFormat('kk:mm:a')
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  viewModel.worldData.updated * 1000))
                              .toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic)),
                  SizedBox(
                    height: 20,
                  ),
                  PieChart(
                    dataMap: viewModel.dataMap,
                    colorList: viewModel.colorList,
                    legendPosition: LegendPosition.bottom,
                    chartRadius: 300,
                    showChartValuesInPercentage: true,
                    showChartValues: false,
                    showChartValueLabel: false,
                    showChartValuesOutside: false,
                    showLegends: false,
                  ),
                ],
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
