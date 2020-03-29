import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/india_data_unoff.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:covid19/views/home/home_view.dart';
import 'package:covid19/views/state_details/state_details_view.dart';
import 'package:covid19/views/world_news/world_news_view.dart';
import 'package:flutter/material.dart';

class CoreViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  IndiaDataUnOff indiaDataUnOff;
  CoreViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchIndiaData() async {
    log.i('fetchIndiadata');
    busy = true;
    indiaDataUnOff = await apiService.getIndiaDataUnOff();
    busy = false;
  }

  void goToStateDetailsPage(int index) {
    this.navigatorService.navigateToPage(MaterialPageRoute(
        builder: (context) => StateDetailsView(
              indiaDataUnOff: indiaDataUnOff.data.statewise.elementAt(index),
            )));
  }

  void goToIndiaHome() {
    this.navigatorService.pop();
  }

  void goToWorldHome() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => HomeView()));
  }
  void goToWorldNews() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => WorldNewsView()));
  }
}
