import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/viewmodels/article_list_view_model.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_coding_challenge/views/article_details_view.dart';
import 'package:flutter_coding_challenge/widgets/article_list_view_builder.dart';
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
        // * here i am switching depeneding on current mode active in the viewmodel between a text title and a search textfield
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
          // * This is the button used to toggle between normal and search mode
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
      // * using the loaded proprety from the viewmodel to get notified when the articles are finishing loading to switch from loader to listbuilder
      body: context.watch<ArticleListViewModel>().loaded
          ? ArticlesListViewBuilder(
              // * checking the search length to know if i should show the filtered articles or all the articles
              articles: articleListViewModel.searchLength > 0
                  ? articleListViewModel.filteredArticles
                  : articleListViewModel.articles,
            )
          : theme.circularLoader,
    );
  }
}
