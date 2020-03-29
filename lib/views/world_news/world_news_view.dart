library world_news_view;

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'world_news_view_model.dart';


part 'world_news_mobile.dart';
part 'world_news_tablet.dart';
part 'world_news_desktop.dart';

class WorldNewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WorldNewsViewModel viewModel = WorldNewsViewModel(apiService: Provider.of(context),
      navigatorService: Provider.of(context),);
    return ViewModelProvider<WorldNewsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        viewModel.fetchNews();
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _WorldNewsMobile(viewModel),
          desktop: _WorldNewsDesktop(viewModel),
          tablet: _WorldNewsTablet(viewModel),  
        );
      }
    );
  }
}