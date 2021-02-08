import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:setup_app/models/news.dart';

@lazySingleton
class GettingNews {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Stories>> populateStories() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return storiesFromJson(response.body);
    } else {
      throw Exception('check internet connection');
    }
  }
}
