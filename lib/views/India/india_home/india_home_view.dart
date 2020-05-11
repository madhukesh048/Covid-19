library core_view;

import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'india_home_view_model.dart';


part 'india_home_mobile.dart';
part 'india_home_tablet.dart';
part 'india_home_desktop.dart';

class IndiaHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IndiaHomeViewModel viewModel = IndiaHomeViewModel(
        apiService: Provider.of(context),
        navigatorService: Provider.of(context));
    return ViewModelProvider<IndiaHomeViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.fetchIndiaData();
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _IndiaHomeMobile(viewModel),
            desktop: _IndiaHomeDesktop(viewModel),
            tablet: _IndiaHomeTablet(viewModel),
          );
        });
  }
}
