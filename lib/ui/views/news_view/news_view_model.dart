import 'package:flutter/material.dart';
import 'package:setup_app/app/locator.dart';
import 'package:setup_app/models/news.dart';
import 'package:setup_app/services/News_services/news.dart';
import 'package:setup_app/ui/views/news_view/news_screen.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsViewModel extends BaseViewModel {
  GettingNews _gettingNews = locator<GettingNews>();
  NavigationService _navigationService = locator<NavigationService>();

  Future<List<Stories>> populateArticles() async {
    return await _gettingNews.populateStories();
  }

  void navigateToNewsScreen(String title, String body) {
    _navigationService.navigateToView(
      NewsScreen(
        title: title,
        body: body,
      ),
    );
  }
}
