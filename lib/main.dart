import 'package:covid19/views/core/core_view.dart';
import 'package:covid19/views/dashboard/dashboard_view.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        theme: ThemeData.light(),
        navigatorKey: locator<NavigatorService>().navigatorKey,
        home: CoreView(),
      ),
    );
  }
}
