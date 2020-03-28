import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/services/data_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final DataService _dataService;

  HomeViewModel({
    @required DataService dataService,
  }) : this._dataService = dataService;

  fetchWorldData() async{
await _dataService.getWorldInfo();
  }
}
