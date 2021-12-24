import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_coding_challenge/views/article_details_view.dart';
import 'package:flutter_coding_challenge/widgets/list_article_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlesListViewBuilder extends StatelessWidget {
  const ArticlesListViewBuilder({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<ArticleViewModel> articles;

  @override
  Widget build(BuildContext context) {
    // * using listview builder for better rendering performance
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            right: 25.w,
            top: 25.h,
            left: 25.w,
            bottom: index == articles.length - 1 ? 25.h : 0,
          ),
          child: InkWell(
            onTap: () {
              // * when article item gets pressed, navigate to article details and pass the clicked article
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ArticleDetailsView(
                    articleViewModel: articles[index],
                  ),
                ),
              );
            },
            child: ListArticleWidget(
              author: articles[index].author,
              publishedDate: articles[index].publishedDate,
              thumbnail: articles[index].thumbnail,
              title: articles[index].title,
            ),
          ),
        );
      },
    );
  }
}
