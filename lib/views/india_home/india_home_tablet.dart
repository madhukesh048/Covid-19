part of india_home_view;

class _IndiaHomeTablet extends StatelessWidget {
  final IndiaHomeViewModel viewModel;

  _IndiaHomeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('IndiaHomeTablet')),
    );
  }
}