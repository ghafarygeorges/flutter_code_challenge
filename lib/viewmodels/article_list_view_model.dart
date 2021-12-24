import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:flutter_coding_challenge/services/news_apis.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:http/http.dart' as http;

class ArticleListViewModel extends ChangeNotifier {
  List<ArticleViewModel> articles = [];
  List<ArticleViewModel> filteredArticles = [];
  bool loaded = false;
  bool searching = false;
  int searchLength = 0;

  Future<void> getArticles(http.Client client) async {
    List<ArticleModel> results = [];
    try {
      results = await NewsApis().getPopularArticles(client);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    for (ArticleModel res in results) {
      articles.add(ArticleViewModel(article: res));
    }
    loaded = true;
    notifyListeners();
  }

  void toggleSearch() {
    searching = !searching;
    searchLength = 0;
    notifyListeners();
  }

  void filterArticles(String str) {
    searchLength = str.length;
    filteredArticles = articles
        .where((article) =>
            article.author.toLowerCase().contains(str.toLowerCase()) ||
            article.title.toLowerCase().contains(str.toLowerCase()) ||
            article.section.toLowerCase().contains(str.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
