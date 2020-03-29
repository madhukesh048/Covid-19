part of home_view;

class _HomeTablet extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORLD'),
        centerTitle: true,
        backgroundColor: Colors.black,
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
                onTap: () {
                  viewModel.goToWorldNews();
                },
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
      body: viewModel.worldData != null
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
                                    (viewModel.worldData.cases).toString(),
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                'Active: ' +
                                    (viewModel.worldData.active).toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blue[300]),
                              ),
                              Text(
                                'Recovered: ' +
                                    (viewModel.worldData.recovered).toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green[400]),
                              ),
                              Text(
                                'Deaths: ' +
                                    (viewModel.worldData.deaths).toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.red[400]),
                              ),
                              Text(
                                'Last updated on: ',
                                // DateFormat('kk:mm:a dd-MM-yyyy')
                                //     .format()
                                //     .toString(),
                                style: TextStyle(
                                    fontSize: 12, fontStyle: FontStyle.italic),
                              ),
                              Expanded(
                                child: PieChart(
                                  dataMap: viewModel.dataMap,
                                  chartRadius: 500,
                                  colorList: viewModel.colorList,
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
                        child: viewModel.countries != null
                            ? ListView.builder(
                                itemCount: viewModel.countries.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      viewModel.goToDetailsPage(index);
                                    },
                                    child: Card(
                                      child: ListTile(
                                        trailing: Icon(Icons.chevron_right),
                                        leading: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Image.network(viewModel
                                              .countries
                                              .elementAt(index)
                                              .countryInfo
                                              .flag),
                                        ),
                                        title: Text(viewModel.countries
                                            .elementAt(index)
                                            .country),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            // Text(
                                            //   'Confirmed: ' +
                                            //       viewModel.countries
                                            //           .elementAt(index)
                                            //           .country
                                            //           .toString(),
                                            //   style: TextStyle(
                                            //     color: Colors.grey,
                                            //   ),
                                            // ),
                                            Text(
                                              'Active: ' +
                                                  viewModel.countries
                                                      .elementAt(index)
                                                      .active
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.blue[300],
                                              ),
                                            ),
                                            // Text(
                                            //   'Recovered: ' +
                                            //       viewModel.countries
                                            //           .elementAt(index)
                                            //           .recovered
                                            //           .toString(),
                                            //   style: TextStyle(
                                            //     color: Colors.green[400],
                                            //   ),
                                            // ),
                                            Text(
                                              'Deaths: ' +
                                                  viewModel.countries
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
                                })
                            : Center(
                                child: CircularProgressIndicator(),
                              )),
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
