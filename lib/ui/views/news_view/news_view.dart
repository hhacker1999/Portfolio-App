import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:setup_app/ui/views/news_view/news_view_model.dart';
import 'package:setup_app/ui/widgets/news_card.dart';
import 'package:stacked/stacked.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsViewModel>.reactive(
      viewModelBuilder: () => NewsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'REST Api ',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: model.populateArticles(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                          itemCount: 20,
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 1.8 : 1.4),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          crossAxisCount: 4,
                          padding: const EdgeInsets.all(4),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                model.navigateToNewsScreen(
                                    snapshot.data[index].title,
                                    snapshot.data[index].body);
                              },
                              child: NewsCard(
                                title: snapshot.data[index].title,
                                body: snapshot.data[index].body,
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
