import 'package:covid19/core/services/api_service.dart';
import 'package:covid19/core/services/http_service.dart';

import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';

class ProviderInjector {
  static List<SingleChildCloneableWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildCloneableWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
    Provider.value(value: HttpService()),
  ];

  static List<SingleChildCloneableWidget> _dependentServices = [
    ProxyProvider<HttpService, ApiService>(update: (context, http, _) {
      return ApiService(httpService: http);
    })
  ];

  static List<SingleChildCloneableWidget> _consumableServices = [];
}
