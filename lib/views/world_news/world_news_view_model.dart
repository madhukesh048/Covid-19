import 'package:covid19/core/base/base_view_model.dart';
import 'package:covid19/core/models/world_news.dart';
import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/navigator_service.dart';
import 'package:covid19/views/core/core_view.dart';
import 'package:covid19/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorldNewsViewModel extends BaseViewModel {
  final ApiService apiService;
  final NavigatorService navigatorService;
  WorldNews worldNews;
  WorldNewsViewModel({
    @required this.apiService,
    @required this.navigatorService,
  });

  void fetchNews() async {
    log.i('fetchNews');
    busy = true;
    worldNews = await apiService.getWorldNews();
    busy = false;
    print(worldNews);
  }

  void goToWorldNews() {
    this.navigatorService.pop();
  }

  void goToWorldHome() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => HomeView()));
  }

  void goToIndiaHome() {
    this
        .navigatorService
        .navigateToPage(MaterialPageRoute(builder: (context) => CoreView()));
  }

  void launchURL(String url) async {
    print(url);

    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
