import 'dart:convert';
import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsApis {
  // * api key to be changed if needed
  final String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";

  Future<List<ArticleModel>> getPopularArticles(http.Client client) async {
    Uri url = Uri.https(
      "api.nytimes.com",
      "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
      {"api-key": _apiKey},
    );
    List<ArticleModel> articles = [];
    // * async get request to the api to return most popular articles
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      // * if status code is 200 => successful response, add elements to list of ArticleModels and return it
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['results'] is List) {
        for (Map<String, dynamic> res in data['results']) {
          articles.add(ArticleModel.fromJson(res));
        }
      }
      return articles;
    } else {
      // * throw exception for failure
      throw Exception("Failed to load articles");
    }
  }
}
