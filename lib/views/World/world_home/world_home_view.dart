library home_view;

import 'package:covid19/views/World/world_home/world_home_view_model.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'world_home_view_model.dart';

part 'world_home_mobile.dart';
part 'world_home_tablet.dart';
part 'world_home_desktop.dart';

class WorldHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WorldHomeViewModel viewModel = WorldHomeViewModel(
      apiService: Provider.of(context),
      navigatorService: Provider.of(context),
    );
    return ViewModelProvider<WorldHomeViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.fetchAllCountries();
          viewModel.fetchWorldData();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _WorldHomeMobile(viewModel),
            desktop: _WorldHomeDesktop(viewModel),
            tablet: _WorldHomeTablet(viewModel),
          );
        });
  }
}
