import 'dart:convert';

import 'package:covid19/core/base/base_service.dart';
import 'package:http/http.dart' as http;

class DataService extends BaseService {
  getWorldInfo() async {
    try {
      var dataFromURL =
          await http.get("https://corona.lmao.ninja/countries?sort=country");
      var jsonData = json.decode(dataFromURL.body);
      print(jsonData);
    } catch (e) {}
  }
}
