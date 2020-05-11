import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/country_data.dart';
import 'package:covid19/core/models/world_data.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:covid19/views/India/india_home/india_home_view.dart';
import 'package:covid19/views/World/country_details/country_details_view.dart';
import 'package:covid19/views/World/world_home/world_home_view.dart';

import 'package:flutter/material.dart';

class WorldHomeViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  List<CountryData> countries;
  List<CountryData> countriesWOI;
  WorldData worldData;

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.blue[300],
    Colors.green[400],
    Colors.red[400],
  ];

  WorldHomeViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchAllCountries() async {
    log.i('fetchAllCountries');
    busy = true;
    countries = await apiService.getAffectedCountries();
    countries.removeWhere((element) => element.countryInfo.id == 356);
    notifyListeners();
    busy = false;
  }

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

  void goToDetailsPage(int index) {
    this.navigatorService.navigateToPage(MaterialPageRoute(
        builder: (context) => CountryDetailsView(
              countries: countries.elementAt(index),
            )));
  }

  void goToIndiaHome() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => IndiaHomeView()));
  }

  void goToWorldHome() {
     this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => WorldHomeView()));
  }

}
