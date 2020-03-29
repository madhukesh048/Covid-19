part of world_news_view;

class _WorldNewsMobile extends StatelessWidget {
  final WorldNewsViewModel viewModel;

  _WorldNewsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World News'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width / 1.6,
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
      body: Center(
          child: viewModel.busy != true
              ? Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                          itemCount: viewModel.worldNews.articles.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 8,
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.launchURL(viewModel
                                      .worldNews.articles
                                      .elementAt(index)
                                      .url);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          viewModel.worldNews.articles
                                              .elementAt(index)
                                              .title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          'source: ' +
                                              viewModel.worldNews.articles
                                                  .elementAt(index)
                                                  .source
                                                  .name,
                                        ),
                                        Text(
                                          'Published At: ' +
                                              DateFormat('kk:mm:a dd-MM-yyyy ,')
                                                  .format(viewModel
                                                      .worldNews.articles
                                                      .elementAt(index)
                                                      .publishedAt),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )
              : CircularProgressIndicator()),
    );
  }
}
