import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/viewmodels/article_list_view_model.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_coding_challenge/views/article_details_view.dart';
import 'package:flutter_coding_challenge/widgets/list_article_widget.dart';
import 'package:flutter_coding_challenge/widgets/search_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticleListViewModel>(context, listen: false)
        .getArticles(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    ArticleListViewModel articleListViewModel =
        Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarBgColor,
        title: context.watch<ArticleListViewModel>().searching
            ? SearchTextField(
                onChanged: (String str) {
                  articleListViewModel.filterArticles(str);
                },
              )
            : Text(
                "NY Times Most Popular",
                style: theme.appBarTitleTheme,
              ),
        actions: [
          IconButton(
            onPressed: () => articleListViewModel.toggleSearch(),
            icon: Icon(
              context.watch<ArticleListViewModel>().searching
                  ? CupertinoIcons.multiply
                  : CupertinoIcons.search,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: context.watch<ArticleListViewModel>().loaded
          ? ListView.builder(
              itemCount: articleListViewModel.searchLength > 0
                  ? articleListViewModel.filteredArticles.length
                  : articleListViewModel.articles.length,
              itemBuilder: (context, index) {
                List<ArticleViewModel> articles =
                    articleListViewModel.searchLength > 0
                        ? articleListViewModel.filteredArticles
                        : articleListViewModel.articles;

                return Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                    top: 25.h,
                    left: 25.w,
                    bottom: index == articles.length - 1 ? 25.h : 0,
                  ),
                  child: InkWell(
                    onTap: () {
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
              })
          : theme.circularLoader,
    );
  }
}
