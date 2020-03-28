import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/country_data.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService apiService;

  HomeViewModel({
    @required this.apiService,
  });

  void fetchAllCountries() async {
    log.i('fetchAllCountries');
    List<CountryData> countries = await apiService.getAffectedCountries();
    countries.forEach((element) {
      log.d('country: ${element.toMap()}');
    });
  }
}
