part of india_home_view;

class _IndiaHomeMobile extends StatelessWidget {
  final IndiaHomeViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.red[400],
    Colors.green[400],
  ];

  _IndiaHomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    viewModel.busy != true
        ? dataMap.putIfAbsent("Active",
            () => viewModel.indiaDataUnOff.data.total.active.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent("Deaths",
            () => viewModel.indiaDataUnOff.data.total.deaths.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent("Recovered",
            () => viewModel.indiaDataUnOff.data.total.recovered.toDouble())
        : Offstage();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'India',
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: viewModel.busy != true
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Total Cases: ' +
                          (viewModel.indiaDataUnOff.data.total.confirmed)
                              .toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PieChart(
                          dataMap: dataMap,
                          colorList: colorList,
                        ),
                      ),
                    ),
                    Text(
                      'State Wise',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: FittedBox(
                          child: DataTable(
                            dataRowHeight: 160,
                            columnSpacing: 60,
                            columns: [
                              DataColumn(
                                  label: Text(
                                'State',
                                style: TextStyle(fontSize: 40),
                              )),
                              DataColumn(
                                  label: Text(
                                'Confirmed',
                                style: TextStyle(fontSize: 40),
                              )),
                              DataColumn(
                                  label: Text(
                                'Active',
                                style: TextStyle(fontSize: 40),
                              )),
                              DataColumn(
                                  label: Text(
                                'Recovered',
                                style: TextStyle(fontSize: 40),
                              )),
                              DataColumn(
                                  label: Text(
                                'Deaths',
                                style: TextStyle(fontSize: 40),
                              )),
                            ],
                            rows: viewModel.indiaDataUnOff.data.statewise
                                .map(
                                  (statewise) => DataRow(cells: [
                                    DataCell(
                                      Text(
                                        statewise.state,
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        statewise.confirmed.toString(),
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        statewise.active.toString(),
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        statewise.recovered.toString(),
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        statewise.deaths.toString(),
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                  ]),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
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
