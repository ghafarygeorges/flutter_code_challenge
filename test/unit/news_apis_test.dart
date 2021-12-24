import 'dart:convert';
import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:flutter_coding_challenge/services/news_apis.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'news_apis_test.mocks.dart';
import 'test_data.dart';

// * This line generates mocks using the http Client
@GenerateMocks([http.Client])
void main() {
  group('newsApi getPopularArticles test', () {
    const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
    Uri url = Uri.https(
      "api.nytimes.com",
      "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
      {"api-key": _apiKey},
    );
    test('return a List of ArticleModels if the call is successful', () async {
      final client = MockClient();
      when(client.get(url)).thenAnswer(
          (_) async => http.Response(jsonEncode(normalWorkingResponse), 200));
      var answer = await NewsApis().getPopularArticles(client);
      expect(answer, isA<List<ArticleModel>>());
      expect(answer.length, greaterThan(0));
    });

    test('return an empty List if the call is successful', () async {
      final client = MockClient();
      when(client.get(url)).thenAnswer(
          (_) async => http.Response(jsonEncode(emptyWorkingResponse), 200));
      var answer = await NewsApis().getPopularArticles(client);
      expect(answer, isA<List<ArticleModel>>());
      expect(answer.length, 0);
    });

    test('throw an exception if call is unsuccessful with 404 error', () {
      final client = MockClient();
      when(client.get(url))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(NewsApis().getPopularArticles(client), throwsException);
    });

    test('throw an exception if call is unsuccessful with 503 error', () {
      final client = MockClient();
      when(client.get(url))
          .thenAnswer((_) async => http.Response('Service Unavailable', 503));
      expect(NewsApis().getPopularArticles(client), throwsException);
    });
  });
}
