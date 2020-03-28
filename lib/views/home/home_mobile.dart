part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mobile'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: FlatButton(onPressed: (){}, child: Text('Press')),
        ));
  }
}
