library core_view;


import 'package:covid19/widgets/deathschart.dart';
import 'package:covid19/widgets/recoveredchart.dart';
import 'package:covid19/widgets/timechart.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'core_view_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

part 'core_mobile.dart';
part 'core_tablet.dart';
part 'core_desktop.dart';

class CoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CoreViewModel viewModel = CoreViewModel(
        apiService: Provider.of(context),
        navigatorService: Provider.of(context));
    return ViewModelProvider<CoreViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.fetchIndiaData();
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _CoreMobile(viewModel),
            desktop: _CoreDesktop(viewModel),
            tablet: _CoreTablet(viewModel),
          );
        });
  }
}
