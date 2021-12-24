import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the factory method in the ArticleModel class', () {
    group('testing the id proprety', () {
      test('testing if passed id is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.id, 0);
      });

      test('testing if passed id is null', () {
        Map<String, dynamic> json = {"id": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.id, 0);
      });

      test('testing if passed id is not an int', () {
        Map<String, dynamic> json = {"id": "123"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.id, 0);
      });

      test('testing if passed id is an int', () {
        Map<String, dynamic> json = {"id": 12};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.id, 12);
      });
    });

    group('testing the publishedDate proprety', () {
      test('testing if passed publishedDate is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.publishedDate, "Unknown Date");
      });

      test('testing if passed publishedDate is null', () {
        Map<String, dynamic> json = {"published_date": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.publishedDate, "Unknown Date");
      });

      test('testing if passed publishedDate is not a string', () {
        Map<String, dynamic> json = {"published_date": 2021};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.publishedDate, "Unknown Date");
      });

      test('testing if passed publishedDate is a string', () {
        Map<String, dynamic> json = {"published_date": "2021-09-29"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.publishedDate, "2021-09-29");
      });
    });

    group('testing the author proprety', () {
      test('testing if passed author is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.author, "Unknown Author");
      });

      test('testing if passed author is null', () {
        Map<String, dynamic> json = {"byline": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.author, "Unknown Author");
      });

      test('testing if passed author is not a string', () {
        Map<String, dynamic> json = {"byline": true};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.author, "Unknown Author");
      });

      test('testing if passed author is a string', () {
        Map<String, dynamic> json = {"byline": "John Doe"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.author, "John Doe");
      });
    });

    group('testing the title proprety', () {
      test('testing if passed title is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.title, "Unknown Title");
      });

      test('testing if passed title is null', () {
        Map<String, dynamic> json = {"title": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.title, "Unknown Title");
      });

      test('testing if passed title is not a string', () {
        Map<String, dynamic> json = {"title": true};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.title, "Unknown Title");
      });

      test('testing if passed title is a string', () {
        Map<String, dynamic> json = {"title": "This is a title"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.title, "This is a title");
      });
    });

    group('testing the abstract proprety', () {
      test('testing if passed abstract is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.abstract, "This article has no abstract");
      });

      test('testing if passed abstract is null', () {
        Map<String, dynamic> json = {"abstract": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.abstract, "This article has no abstract");
      });

      test('testing if passed abstract is not a string', () {
        Map<String, dynamic> json = {"abstract": true};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.abstract, "This article has no abstract");
      });

      test('testing if passed abstract is a string', () {
        Map<String, dynamic> json = {"abstract": "This is an abstract"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.abstract, "This is an abstract");
      });
    });

    group('testing the section proprety', () {
      test('testing if passed section is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.section, "Unknown Section");
      });

      test('testing if passed section is null', () {
        Map<String, dynamic> json = {"section": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.section, "Unknown Section");
      });

      test('testing if passed section is not a string', () {
        Map<String, dynamic> json = {"section": true};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.section, "Unknown Section");
      });

      test('testing if passed section is a string', () {
        Map<String, dynamic> json = {"section": "Health"};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.section, "Health");
      });
    });

    group('testing the thumbnail proprety', () {
      test('testing if passed media is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test('testing if passed media is null', () {
        Map<String, dynamic> json = {"media": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test('testing if passed media is null', () {
        Map<String, dynamic> json = {"media": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test('testing if passed media is not a List', () {
        Map<String, dynamic> json = {"media": {}};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test('testing if passed media is a List but is empty', () {
        Map<String, dynamic> json = {"media": []};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that doesnt contain maps as items',
          () {
        Map<String, dynamic> json = {
          "media": [1, 2, 3]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items but the first map does not have media-metadata',
          () {
        Map<String, dynamic> json = {
          "media": [{}]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata but it is null',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": null}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata but it is not a List',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": {}}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata and it is a List but it is empty',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": []}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List but it doesnt contain maps as items',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [1, 2, 3]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List but it contains an empty first map',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {},
                {"url": "123"}
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List but its first map has a null url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": null},
                {"url": "123"}
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List but its first map has a non String url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": 123},
                {"url": "123"}
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List and its first map has a String url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": "image-url-string"},
                {"url": "123"}
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.thumbnail, "image-url-string");
      });
    });

    group('testing the image proprety', () {
      test('testing if passed media is non existent', () {
        Map<String, dynamic> json = {};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test('testing if passed media is null', () {
        Map<String, dynamic> json = {"media": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test('testing if passed media is null', () {
        Map<String, dynamic> json = {"media": null};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test('testing if passed media is not a List', () {
        Map<String, dynamic> json = {"media": {}};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test('testing if passed media is a List but is empty', () {
        Map<String, dynamic> json = {"media": []};
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that doesnt contain maps as items',
          () {
        Map<String, dynamic> json = {
          "media": [1, 2, 3]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items but the first map does not have media-metadata',
          () {
        Map<String, dynamic> json = {
          "media": [{}]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata but it is null',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": null}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata but it is not a List',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": {}}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has media-metadata and it is a List but it is empty',
          () {
        Map<String, dynamic> json = {
          "media": [
            {"media-metadata": []}
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the first map has has media-metadata and it is a List but it doesnt contain maps as items',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [1, 2, 3]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the last map has has media-metadata and it is a List but it contains an empty first map',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": "123"},
                {}
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the last map has has media-metadata and it is a List but its first map has a null url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": "123"},
                {"url": null},
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the last map has has media-metadata and it is a List but its first map has a non String url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": "123"},
                {"url": 123},
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "");
      });

      test(
          'testing if passed media is a List that contains maps as items and the last map has has media-metadata and it is a List and its first map has a String url value',
          () {
        Map<String, dynamic> json = {
          "media": [
            {
              "media-metadata": [
                {"url": "123"},
                {"url": "image-url-string"},
              ]
            }
          ]
        };
        ArticleViewModel article =
            ArticleViewModel(article: ArticleModel.fromJson(json));
        expect(article.image, "image-url-string");
      });
    });
  });
}
