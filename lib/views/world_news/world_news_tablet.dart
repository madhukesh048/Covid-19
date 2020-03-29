part of world_news_view;

class _WorldNewsTablet extends StatelessWidget {
  final WorldNewsViewModel viewModel;

  _WorldNewsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('WORLD NEWS'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                    child: Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              ListTile(
                onTap: () {
                  viewModel.goToIndiaHome();
                },
                title: Text(
                  "INDIA",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: () {
                  viewModel.goToWorldHome();
                },
                title: Text(
                  "WORLD",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                onTap: viewModel.goToWorldNews,
                title: Text(
                  "NEWS",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // ListTile(
              //   title: Text(
              //     "HELP",
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
            ],
          ),
        ),
      ),
        body: viewModel.busy != true
            ? GridView.count(
                crossAxisCount: 4,
                children: List<Widget>.generate(
                    viewModel.worldNews.articles.length, (index) {
                  return GridTile(
                    child: GestureDetector(
                      onTap: () {
                        viewModel.launchURL(
                            viewModel.worldNews.articles.elementAt(index).url);
                      },
                      child: Card(
                          color: Colors.grey[200],
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.width / 8,
                                    child: Image.network(viewModel
                                            .worldNews.articles
                                            .elementAt(index)
                                            .urlToImage ??
                                        'https://www.ajactraining.org/wp-content/uploads/2019/09/image-placeholder.jpg'),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewModel.worldNews.articles
                                          .elementAt(index)
                                          .title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  Text(
                                    'Source: ' +
                                        viewModel.worldNews.articles
                                            .elementAt(index)
                                            .source
                                            .name,
                                            style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Published At: ' +
                                        DateFormat('kk:mm:a dd-MM-yyyy')
                                            .format(viewModel.worldNews.articles
                                                .elementAt(index)
                                                .publishedAt),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'Continue Reading...',
                                      style: TextStyle(
                                        fontSize: 10,
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  );
                }),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}