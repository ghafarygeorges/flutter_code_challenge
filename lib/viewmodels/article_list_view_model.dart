import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:flutter_coding_challenge/services/news_apis.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:http/http.dart' as http;

class ArticleListViewModel extends ChangeNotifier {
  // * articles list hold all articles
  List<ArticleViewModel> articles = [];
  // * filteredArticles list hold all filtered articles
  List<ArticleViewModel> filteredArticles = [];
  // * loaded proprety becomes true when articles get loaded
  bool loaded = false;
  // * searching becomes true when search mode is toggled
  bool searching = false;
  // * searchLength changes depending on the search text field input
  int searchLength = 0;

  // * Function that gets called on the initialization of the main screen and calls the api to get articles the notifies the view
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

  // * function used when switching between normal and search mode on the main screen
  void toggleSearch() {
    searching = !searching;
    searchLength = 0;
    notifyListeners();
  }

  // * function used when typing in the search textfield to locally filter by matching authors, titles and sections.
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
