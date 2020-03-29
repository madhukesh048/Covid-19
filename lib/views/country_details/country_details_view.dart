library country_details_view;

import 'package:covid19/core/models/country_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'country_details_view_model.dart';

part 'country_details_mobile.dart';
part 'country_details_tablet.dart';
part 'country_details_desktop.dart';

class CountryDetailsView extends StatelessWidget {
  final CountryData countries;
  CountryDetailsView({
    @required this.countries
  });
  @override
  Widget build(BuildContext context) {
    CountryDetailsViewModel viewModel = CountryDetailsViewModel(countries: countries);
    return ViewModelProvider<CountryDetailsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _CountryDetailsMobile(viewModel),
          desktop: _CountryDetailsDesktop(viewModel),
          tablet: _CountryDetailsTablet(viewModel),  
        );
      }
    );
  }
}