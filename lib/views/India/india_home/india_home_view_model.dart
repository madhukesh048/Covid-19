import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/india_data.dart';
import 'package:covid19/core/models/india_data_unoff.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:covid19/views/India/india_home/india_home_view.dart';
import 'package:covid19/views/India/state_details/state_details_view.dart';
import 'package:covid19/views/World/world_home/world_home_view.dart';
import 'package:flutter/material.dart';

class IndiaHomeViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  IndiaDataUnOff indiaDataUnOff;
  IndiaData indiaData;
  IndiaHomeViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchIndiaData() async {
    log.i('fetchIndiadata');
    busy = true;
    indiaDataUnOff = await apiService.getIndiaData();
    busy = false;
  }


  void goToStateDetailsPage(int index) {
    this.navigatorService.navigateToPage(MaterialPageRoute(
        builder: (context) => StateDetailsView(
              indiaDataUnOff: indiaDataUnOff.data.statewise.elementAt(index),
            )));
  }

  void goToIndiaHome(){
    this.navigatorService.navigateToPageWithReplacement(MaterialPageRoute(builder: (context) => IndiaHomeView()));
  }

  void goToWorldHome() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => WorldHomeView()));
  }

 
}
