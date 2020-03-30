part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

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
                    leading: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.network(
                          viewModel.countries.elementAt(i).countryInfo.flag),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Active: ' +
                              viewModel.countries
                                  .elementAt(i)
                                  .active
                                  .toString(),
                          style: TextStyle(color: Colors.blue[300]),
                        ),
                        SizedBox(width: 20),
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
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 8, 0, 8),
                      child: Text(
                        viewModel.countries.elementAt(i).country,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(child: CircularProgressIndicator());
  }

  Widget getStatsPage() {
    var updatedDate =
        DateTime.fromMillisecondsSinceEpoch(viewModel.worldData.updated * 1000);
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
                          DateFormat('kk:mm:a').format(updatedDate).toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic)),
                  SizedBox(
                    height: 40,
                  ),
                  PieChart(
                    dataMap: viewModel.dataMap,
                    colorList: viewModel.colorList,
                    legendPosition: LegendPosition.bottom,
                    chartRadius: 300,
                    showChartValuesInPercentage: false,
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
