part of india_home_view;

class _IndiaHomeDesktop extends StatelessWidget {
  final IndiaHomeViewModel viewModel;

  _IndiaHomeDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('IndiaHomeDesktop')),
    );
  }
}