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

    return Scaffold(
      appBar: AppBar(
        title: Text('INDIA'),
        backgroundColor: Colors.black,
        centerTitle: true,
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
      body: viewModel.busy != true
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Total Cases: ' +
                                    (viewModel.indiaDataUnOff.data.total
                                            .confirmed)
                                        .toString(),
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Active: ' +
                                        (viewModel.indiaDataUnOff.data.total
                                                .active)
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
                                        (viewModel.indiaDataUnOff.data.total
                                                .deaths)
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red[400]),
                                  ),
                                ],
                              ),
                              PieChart(
                                dataMap: dataMap,
                                colorList: colorList,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'STATES DATA',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: viewModel
                                  .indiaDataUnOff.data.statewise.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    viewModel.goToStateDetailsPage(index);
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(viewModel
                                          .indiaDataUnOff.data.statewise
                                          .elementAt(index)
                                          .state),
                                      trailing: Icon(Icons.chevron_right),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Active: ' +
                                                viewModel.indiaDataUnOff.data
                                                    .statewise
                                                    .elementAt(index)
                                                    .active
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.blue[300],
                                            ),
                                          ),
                                          Text(
                                            'Recovered: ' +
                                                viewModel.indiaDataUnOff.data
                                                    .statewise
                                                    .elementAt(index)
                                                    .recovered
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.green[400],
                                            ),
                                          ),
                                          Text(
                                            'Deaths: ' +
                                                viewModel.indiaDataUnOff.data
                                                    .statewise
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
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
