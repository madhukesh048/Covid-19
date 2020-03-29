part of country_details_view;

class _CountryDetailsMobile extends StatelessWidget {
  final CountryDetailsViewModel viewModel;

  _CountryDetailsMobile(this.viewModel);
  final Map<String, double> dataMap = Map();
  final List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  @override
  Widget build(BuildContext context) {
    dataMap.putIfAbsent("Active", () => viewModel.countries.active.toDouble());

    dataMap.putIfAbsent(
        "Recovered", () => viewModel.countries.recovered.toDouble());
    dataMap.putIfAbsent("Deaths", () => viewModel.countries.deaths.toDouble());
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.countries.country),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Cases',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.cases.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Active',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.active.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Deaths',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.deaths.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Recovered',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.recovered.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Todays Cases',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.todayCases.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Todays Deaths',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        viewModel.countries.todayDeaths.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: PieChart(
              chartRadius: MediaQuery.of(context).size.width,
              dataMap: dataMap,
              colorList: colorList,
              showChartValues: false,
              showChartValueLabel: false,
              showChartValuesOutside: false,
              legendPosition: LegendPosition.bottom,
              legendStyle: TextStyle(fontSize: 18),
              chartValueStyle: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
