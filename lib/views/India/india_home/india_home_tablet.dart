part of core_view;

class _IndiaHomeTablet extends StatelessWidget {
  final IndiaHomeViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _IndiaHomeTablet(this.viewModel);

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

    return Scaffold(
      appBar: AppBar(
        title: Text('INDIA'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Text(
                  'Menu',
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
                onTap: (){
                  viewModel.goToIndiaHome();
                },
                title: Text(
                  "INDIA",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: viewModel.goToWorldHome,
                title: Text(
                  "WORLD",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              
            
            ],
          ),
        ),
      ),
      body: viewModel.busy != true
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total Cases: ' +
                                    (viewModel.indiaDataUnOff.data.total
                                            .confirmed)
                                        .toString(),
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                'Active: ' +
                                    (viewModel.indiaDataUnOff.data.total.active)
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue[300]),
                              ),
                              Text(
                                'Recovered: ' +
                                    (viewModel.indiaDataUnOff.data.total
                                            .recovered)
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green[400]),
                              ),
                              Text(
                                'Deaths: ' +
                                    (viewModel.indiaDataUnOff.data.total.deaths)
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.red[400]),
                              ),
                              Text(
                                'Last updated on: ' +
                                    DateFormat('kk:mm:a dd-MM-yyyy')
                                        .format(viewModel
                                            .indiaDataUnOff.data.lastRefreshed)
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                              Expanded(
                                child: PieChart(
                                  dataMap: dataMap,
                                  chartRadius: 500,
                                  colorList: colorList,
                                  showChartValuesInPercentage: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount:
                                viewModel.indiaDataUnOff.data.statewise.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.goToStateDetailsPage(index);
                                },
                                child: Card(
                                  child: ListTile(
                                    trailing: Icon(Icons.chevron_right),
                                    title: Text(viewModel
                                        .indiaDataUnOff.data.statewise
                                        .elementAt(index)
                                        .state),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // Text(
                                        //   'Confirmed: ' +
                                        //       viewModel
                                        //           .indiaDataUnOff.data.statewise
                                        //           .elementAt(index)
                                        //           .confirmed
                                        //           .toString(),
                                        //   style: TextStyle(
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                        Text(
                                          'Active: ' +
                                              viewModel
                                                  .indiaDataUnOff.data.statewise
                                                  .elementAt(index)
                                                  .active
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.blue[300],
                                          ),
                                        ),
                                        Text(
                                          'Recovered: ' +
                                              viewModel
                                                  .indiaDataUnOff.data.statewise
                                                  .elementAt(index)
                                                  .recovered
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.green[400],
                                          ),
                                        ),
                                        Text(
                                          'Deaths: ' +
                                              viewModel
                                                  .indiaDataUnOff.data.statewise
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
                            })),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
