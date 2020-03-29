import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/country_data.dart';
import 'package:covid19/core/models/date_wise_count.dart';
import 'package:covid19/core/models/world_data.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:covid19/views/home/home_view.dart';
import 'package:covid19/views/india_home/india_home_view.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  WorldData worldData;
  List<CountryData> countries;
  DateWiseCount dateWiseCount;

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  DashboardViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchWorldData() async {
    log.i('fetchWorldData');
    busy = true;
    worldData = await apiService.getWorldData();
    print(worldData.active);
    dataMap.putIfAbsent("Active", () => worldData.active.toDouble());

    dataMap.putIfAbsent("Recovered", () => worldData.recovered.toDouble());
    dataMap.putIfAbsent("Deaths", () => worldData.deaths.toDouble());
    busy = false;
    // fetchDateWiseCount();
  }

  // void fetchDateWiseCount() async {
  //   log.i('fetchDateWiseCount');
  //   busy = true;
  //   dateWiseCount = await apiService.getDateWiseCount();
  //   print(dateWiseCount.result);
  //   busy = false;
  // }

  void goToWorldHomePage() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => HomeView()));
  }

  void goToIndiaHomePage() {
    this.navigatorService.navigateToPage(
        MaterialPageRoute(builder: (context) => IndiaHomeView()));
  }
}
