import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/models/news.dart';
import 'package:assignment/utils/apiPath.dart';

class NewsProvider extends ChangeNotifier {
  News news = new News();
  List<Article> articlesList = [];

  Future<List<Article>> getNews() async {
    final response = await http.get(APIData.apiLink);
    if (response.statusCode == 200) {
      news = News.fromJson(json.decode(response.body));
      articlesList = List.generate(news.articles.length, (index) {
        return Article(
          source: news.articles[index].source,
          title: news.articles[index].title,
          author: news.articles[index].author,
          description: news.articles[index].description,
          url: news.articles[index].url,
          content: news.articles[index].content,
          publishedAt: news.articles[index].publishedAt,
          urlToImage: news.articles[index].urlToImage,
        );
      });
      print(news.status);
    } else if (response.statusCode == 401) {
      throw "Can't get menus";
    } else {
      throw "Can't get menus";
    }
    notifyListeners();
    return articlesList;
  }
}
