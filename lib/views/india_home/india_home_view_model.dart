import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/india_data.dart';
import 'package:covid19/core/models/india_data_unoff.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:flutter/material.dart';

class IndiaHomeViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  IndiaDataUnOff indiaDataUnOff;
  IndiaHomeViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchIndiaData() async {
    log.i('fetchIndiadata');
    busy = true;
    indiaDataUnOff = await apiService.getIndiaDataUnOff();
    busy = false;
  }
}
