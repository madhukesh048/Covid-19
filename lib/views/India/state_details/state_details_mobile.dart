part of state_details_view;

class _StateDetailsMobile extends StatelessWidget {
  final StateDetailsViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _StateDetailsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Active", () => viewModel.indiaDataUnOff.active.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Recovered", () => viewModel.indiaDataUnOff.recovered.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Deaths", () => viewModel.indiaDataUnOff.deaths.toDouble())
        : Offstage();
    return Scaffold(
      appBar: AppBar(
          title: Text(viewModel.indiaDataUnOff.state),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total Cases: ' +
                        (viewModel.indiaDataUnOff.confirmed).toString(),
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Active: ' + (viewModel.indiaDataUnOff.active).toString(),
                    style: TextStyle(fontSize: 22, color: Colors.blue[300]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Recovered: ' +
                        (viewModel.indiaDataUnOff.recovered).toString(),
                    style: TextStyle(fontSize: 22, color: Colors.green[400]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Deaths: ' + (viewModel.indiaDataUnOff.deaths).toString(),
                    style: TextStyle(fontSize: 22, color: Colors.red[400]),
                  ),
                ],
              ),
              Expanded(
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: 400,
                  showChartValuesInPercentage: true,
                  showChartValues: false,
                  showChartValueLabel: false,
                  showChartValuesOutside: false,
                  showLegends: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
