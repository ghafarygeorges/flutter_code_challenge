import 'package:flutter_coding_challenge/models/article_model.dart';

// * Article ViewModel class to access ArticleModel data from Views
class ArticleViewModel {
  final ArticleModel _article;

  ArticleViewModel({required ArticleModel article}) : _article = article;

  int get id => _article.id;

  String get publishedDate => _article.publishedDate;

  String get author => _article.author;

  String get title => _article.title;

  String get abstract => _article.abstract;

  String get thumbnail => _article.thumbnail;

  String get image => _article.image;

  String get section => _article.section;
}
