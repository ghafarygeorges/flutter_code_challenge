import 'dart:convert';
import 'package:flutter_coding_challenge/viewmodels/article_list_view_model.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'news_apis_test.mocks.dart';
import 'test_data.dart';

void main() {
  group('ArticleListViewModel tests', () {
    group('testing getArticles function', () {
      const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
      Uri url = Uri.https(
        "api.nytimes.com",
        "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
        {"api-key": _apiKey},
      );
      test(
          'articles is a list of ArticleViewModels and is not empty if api is successful',
          () async {
        final client = MockClient();
        ArticleListViewModel model = ArticleListViewModel();
        when(client.get(url)).thenAnswer(
            (_) async => http.Response(jsonEncode(normalWorkingResponse), 200));
        await model.getArticles(client);
        expect(model.articles, isA<List<ArticleViewModel>>());
        expect(model.articles.length, greaterThan(0));
      });

      test(
          'articles is a list of ArticleViewModel and is empty if api is successful but response results are empty',
          () async {
        final client = MockClient();
        ArticleListViewModel model = ArticleListViewModel();
        when(client.get(url)).thenAnswer(
            (_) async => http.Response(jsonEncode(emptyWorkingResponse), 200));
        await model.getArticles(client);
        expect(model.articles, isA<List<ArticleViewModel>>());
        expect(model.articles.length, 0);
      });

      test(
          'articles is a list of ArticleViewModel and is empty if api throws an exception',
          () async {
        final client = MockClient();
        ArticleListViewModel model = ArticleListViewModel();
        when(client.get(url))
            .thenAnswer((_) async => http.Response('Not Found', 404));
        expect(model.articles, isA<List<ArticleViewModel>>());
        expect(model.articles.length, 0);
      });
    });

    group('testing toggleSearch function', () {
      test('testing if currently searching and exiting search mode', () {
        ArticleListViewModel model = ArticleListViewModel();
        model.searching = true;
        model.searchLength = 5;
        model.toggleSearch();
        expect(model.searching, false);
        expect(model.searchLength, 0);
      });

      test('testing if currently in normal mode and toggling search mode', () {
        ArticleListViewModel model = ArticleListViewModel();
        model.searching = false;
        model.searchLength = 0;
        model.toggleSearch();
        expect(model.searching, true);
        expect(model.searchLength, 0);
      });
    });

    group('testing filterArticles function', () {
      test('filterArticles if articles are empty', () {
        ArticleListViewModel model = ArticleListViewModel();
        model.filterArticles("a");
        expect(model.filteredArticles.length, 0);
      });

      group('filterArticles if articles are not empty', () {
        group('author only tests', () {
          test('testing author name with 2 matches all upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("DOE");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].author.toLowerCase(),
                contains("doe"));
            expect(model.filteredArticles[1].author.toLowerCase(),
                contains("doe"));
            model.toggleSearch();
          });

          test('testing author name with 2 matches all lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("doe");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].author.toLowerCase(),
                contains("doe"));
            expect(model.filteredArticles[1].author.toLowerCase(),
                contains("doe"));
            model.toggleSearch();
          });

          test('testing author name with 2 matches case variation', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("dOE");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].author.toLowerCase(),
                contains("doe"));
            expect(model.filteredArticles[1].author.toLowerCase(),
                contains("doe"));
            model.toggleSearch();
          });

          test('testing author name with 1 match', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("john");
            expect(model.filteredArticles.length, 1);
            expect(model.filteredArticles[0].author.toLowerCase(),
                contains("john"));
            model.toggleSearch();
          });
        });

        group('title only tests', () {
          test('testing title with 2 matches all upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("TITLE");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].title.toLowerCase(),
                contains("title"));
            expect(model.filteredArticles[1].title.toLowerCase(),
                contains("title"));
            model.toggleSearch();
          });

          test('testing title with 2 matches all lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("title");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].title.toLowerCase(),
                contains("title"));
            expect(model.filteredArticles[1].title.toLowerCase(),
                contains("title"));
            model.toggleSearch();
          });

          test('testing title with 2 matches case variation', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("tItLE");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].title.toLowerCase(),
                contains("title"));
            expect(model.filteredArticles[1].title.toLowerCase(),
                contains("title"));
            model.toggleSearch();
          });

          test('testing title with 1 match', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("title 2");
            expect(model.filteredArticles.length, 1);
            expect(model.filteredArticles[0].title.toLowerCase(),
                contains("title 2"));
            model.toggleSearch();
          });
        });

        group('section only tests', () {
          test('testing section with 2 matches all upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("HEALTH");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("health"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("health"));
            model.toggleSearch();
          });

          test('testing section with 2 matches all lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("health");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("health"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("health"));
            model.toggleSearch();
          });

          test('testing section with 2 matches case variation', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("hEAltH");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("health"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("health"));
            model.toggleSearch();
          });

          test('testing section with 1 match', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("health and fitness");
            expect(model.filteredArticles.length, 1);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("health and fitness"));
            model.toggleSearch();
          });
        });

        group('matches author and title', () {
          test('author and title 2 matches upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("HN");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].author.toLowerCase(), contains("hn"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("hn"));
            model.toggleSearch();
          });

          test('author and title 2 matches lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("hn");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].author.toLowerCase(), contains("hn"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("hn"));
            model.toggleSearch();
          });

          test('author and title 2 matches random case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("hN");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].author.toLowerCase(), contains("hn"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("hn"));
            model.toggleSearch();
          });
        });

        group('matches section and title', () {
          test('section and title 2 matches upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("ND");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].title.toLowerCase(), contains("nd"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("nd"));
            model.toggleSearch();
          });

          test('section and title 2 matches lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("nd");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].title.toLowerCase(), contains("nd"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("nd"));
            model.toggleSearch();
          });

          test('section and title 2 matches random case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("nD");
            expect(model.filteredArticles.length, 2);
            expect(
                model.filteredArticles[0].title.toLowerCase(), contains("nd"));
            expect(model.filteredArticles[1].section.toLowerCase(),
                contains("nd"));
            model.toggleSearch();
          });
        });

        group('matches section and author', () {
          test('section and title 2 matches upper case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("TH");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("th"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("th"));
            model.toggleSearch();
          });

          test('section and title 2 matches lower case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("th");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("th"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("th"));
            model.toggleSearch();
          });

          test('section and title 2 matches random case', () async {
            const String _apiKey = "115jsaWsHOGPIHGNOAMe63wEpbRZFheo";
            Uri url = Uri.https(
              "api.nytimes.com",
              "/svc/mostpopular/v2/mostviewed/all-sections/7.json",
              {"api-key": _apiKey},
            );
            final client = MockClient();
            ArticleListViewModel model = ArticleListViewModel();
            when(client.get(url)).thenAnswer((_) async =>
                http.Response(jsonEncode(normalWorkingResponse), 200));
            await model.getArticles(client);
            model.filterArticles("tH");
            expect(model.filteredArticles.length, 2);
            expect(model.filteredArticles[0].section.toLowerCase(),
                contains("th"));
            expect(
                model.filteredArticles[1].title.toLowerCase(), contains("th"));
            model.toggleSearch();
          });
        });
      });
    });
  });
}
