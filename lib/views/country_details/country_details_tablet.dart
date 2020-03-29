part of country_details_view;

class _CountryDetailsTablet extends StatelessWidget {
   final CountryDetailsViewModel viewModel;
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  _CountryDetailsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Active", () => viewModel.countries.active.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Recovered", () => viewModel.countries.recovered.toDouble())
        : Offstage();
    viewModel.busy != true
        ? dataMap.putIfAbsent(
            "Deaths", () => viewModel.countries.deaths.toDouble())
        : Offstage();
    return Scaffold(
      appBar: AppBar(
          title: Text(viewModel.countries.country),
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
                          (viewModel.countries.cases).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Active: ' + (viewModel.countries.active).toString(),
                      style: TextStyle(fontSize: 18, color: Colors.blue[300]),
                    ),
                    Text(
                      'Recovered: ' +
                          (viewModel.countries.recovered).toString(),
                      style: TextStyle(fontSize: 18, color: Colors.green[400]),
                    ),
                    Text(
                      'Deaths: ' + (viewModel.countries.deaths).toString(),
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
