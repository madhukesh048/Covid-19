import 'dart:convert';

import 'package:covid19/core/models/world_data.dart';
import 'package:covid19/core/models/country_data.dart';
import 'package:covid19/core/services/http_service.dart';
import 'package:flutter/material.dart';

import '../base/base_service.dart';

class ApiService extends BaseService {
  static const _BASE_URL = 'https://corona.lmao.ninja';

  final HttpService httpService;

  ApiService({@required this.httpService});

  Future<WorldData> getWorldData() async {
    String response = await httpService.makeGetRequest<String>(
      url: '$_BASE_URL/all',
    );

    WorldData data = WorldData.fromJson(response);
    if (data == null) log.e('Invalid response');
    return data;
  }

  Future<List<CountryData>> getAffectedCountries() async {
    String response = await httpService.makeGetRequest<String>(
      url: '$_BASE_URL/countries',
    );

    List<Map<String, dynamic>> responseList = List.castFrom(jsonDecode(response));

    if (responseList == null) return [];
    return responseList.map((e) {
      CountryData data = CountryData.fromMap(e);
      if (data == null) log.e('Invalid response');
      return data;
    }).toList();
  }
}
