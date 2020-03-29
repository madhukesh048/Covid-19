part of state_details_view;

class _StateDetailsTablet extends StatelessWidget {
final StateDetailsViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _StateDetailsTablet(this.viewModel);

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
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Cases: ' +
                          (viewModel.indiaDataUnOff.confirmed).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Active: ' + (viewModel.indiaDataUnOff.active).toString(),
                      style: TextStyle(fontSize: 18, color: Colors.blue[300]),
                    ),
                    Text(
                      'Recovered: ' +
                          (viewModel.indiaDataUnOff.recovered).toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green[400]),
                    ),
                    Text(
                      'Deaths: ' + (viewModel.indiaDataUnOff.deaths).toString(),
                      style: TextStyle(fontSize: 18, color: Colors.red[400]),
                    ),
                  ],
                ),
                Expanded(
                  child: PieChart(
                    dataMap: dataMap,
                    colorList: colorList,
                    chartRadius: 500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}