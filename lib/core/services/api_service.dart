import 'dart:convert';

import 'package:covid19/core/models/date_wise_count.dart';
import 'package:covid19/core/models/india_data.dart';
import 'package:covid19/core/models/india_data_unoff.dart';
import 'package:covid19/core/models/world_data.dart';
import 'package:covid19/core/models/country_data.dart';
import 'package:covid19/core/models/world_news.dart';
import 'package:covid19/core/services/http_service.dart';
import 'package:flutter/material.dart';

import '../base/base_service.dart';

class ApiService extends BaseService {
  static const _BASE_URL = 'https://corona.lmao.ninja';
  static const _DATEWISE_URL = 'https://covidapi.info/api/v1/global/count';
  static const _INDIA_URL =
      'https://api.rootnet.in/covid19-in/stats/latest'; //official
  static const _INDIA_URL_UNOFF =
      'https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise'; //unoff

  static const _WORLD_NEWS_URL =
      'https://newsapi.org/v2/everything?q=COVID&from=2020-03-16&sortBy=publishedAt&apiKey=7f3341405a794a92a026e79902e89593&pageSize=100&language=en';

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

    List<Map<String, dynamic>> responseList =
        List.castFrom(jsonDecode(response));

    if (responseList == null) return [];
    return responseList.map((e) {
      CountryData data = CountryData.fromMap(e);
      if (data == null) log.e('Invalid response');
      return data;
    }).toList();
  }

  Future<IndiaData> getIndiaData() async {
    String response =
        await httpService.makeGetRequest<String>(url: '$_INDIA_URL');
    print(response);
    Map<String, dynamic> data = jsonDecode(response);

    IndiaData indiaData = IndiaData.fromMap(data);
    print(indiaData);
    return indiaData;
  }

  Future<IndiaDataUnOff> getIndiaDataUnOff() async {
    String response =
        await httpService.makeGetRequest<String>(url: '$_INDIA_URL_UNOFF');
    print(response);
    Map<String, dynamic> data = jsonDecode(response);

    IndiaDataUnOff indiaData = IndiaDataUnOff.fromMap(data);
    print(indiaData);
    return indiaData;
  }

  Future<DateWiseCount> getDateWiseCount() async {
    String response = await httpService.makeGetRequest<String>(
      url: '$_DATEWISE_URL',
    );
    Map<String, dynamic> data = jsonDecode(response);

    DateWiseCount countData = DateWiseCount.fromMap(data);
    if (data == null) log.e('Invalid response');
    return countData;
  }

  Future<WorldNews> getWorldNews() async {
    String response = await httpService.makeGetRequest<String>(
      url: '$_WORLD_NEWS_URL',
    );
    Map<String, dynamic> data = jsonDecode(response);

    WorldNews newsData = WorldNews.fromMap(data);
    if (data == null) log.e('Invalid response');
    return newsData;
  }
}
