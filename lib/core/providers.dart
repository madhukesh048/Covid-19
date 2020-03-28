import 'package:covid19/core/services/data_service.dart';

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
    Provider.value(value: locator<DataService>())
  ];

  static List<SingleChildCloneableWidget> _dependentServices = [];
  
  static List<SingleChildCloneableWidget> _consumableServices = [];
}