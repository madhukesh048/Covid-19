library state_details_view;

import 'package:covid19/core/models/india_data_unoff.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'state_details_view_model.dart';

part 'state_details_mobile.dart';
part 'state_details_tablet.dart';
part 'state_details_desktop.dart';

class StateDetailsView extends StatelessWidget {
  final Total indiaDataUnOff;

  StateDetailsView({
    this.indiaDataUnOff
  });
  @override
  Widget build(BuildContext context) {
    StateDetailsViewModel viewModel = StateDetailsViewModel(indiaDataUnOff:indiaDataUnOff);
    return ViewModelProvider<StateDetailsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _StateDetailsMobile(viewModel),
          desktop: _StateDetailsDesktop(viewModel),
          tablet: _StateDetailsTablet(viewModel),  
        );
      }
    );
  }
}