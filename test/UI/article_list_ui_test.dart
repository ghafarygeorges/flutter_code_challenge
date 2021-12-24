import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/main.dart';
import 'package:flutter_coding_challenge/viewmodels/article_list_view_model.dart';
import 'package:flutter_coding_challenge/widgets/article_list_view_builder.dart';
import 'package:flutter_coding_challenge/widgets/circular_network_image.dart';
import 'package:flutter_coding_challenge/widgets/list_article_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../unit/news_apis_test.mocks.dart';
import '../unit/test_data.dart';

void main() {
  group('testing ArticleListView UI and Widgets', () {
    testWidgets("test appbar initial state (searching == false)",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final iconButton = find.byType(IconButton);
      final searchIcon = find.byIcon(CupertinoIcons.search);
      final xIcon = find.byIcon(CupertinoIcons.multiply);
      final appTitle = find.text("NY Times Most Popular");
      final textField = find.byType(TextField);

      expect(iconButton, findsOneWidget);
      expect(searchIcon, findsOneWidget);
      expect(xIcon, findsNothing);
      expect(appTitle, findsOneWidget);
      expect(textField, findsNothing);
    });

    testWidgets("test appbar search state (searching == true)",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final iconButton = find.byType(IconButton);
      await tester.tap(iconButton);
      await tester.pump();

      final searchIcon = find.byIcon(CupertinoIcons.search);
      final xIcon = find.byIcon(CupertinoIcons.multiply);
      final appTitle = find.text("NY Times Most Popular");
      final textField = find.byType(TextField);

      expect(iconButton, findsOneWidget);
      expect(searchIcon, findsNothing);
      expect(xIcon, findsOneWidget);
      expect(appTitle, findsNothing);
      expect(textField, findsOneWidget);
    });

    testWidgets('testing on TextFieldValue change',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final iconButton = find.byType(IconButton);
      await tester.tap(iconButton);
      await tester.pump();
      final textField = find.byType(TextField);
      await tester.enterText(textField, "this is textfield text");

      final tfText = find.widgetWithText(TextField, "this is textfield text");
      expect(tfText, findsOneWidget);
    });

    testWidgets('test listviewbuilder availability',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final articlelistviewbuilder = find.byType(ArticlesListViewBuilder);

      expect(articlelistviewbuilder, findsOneWidget);
    });

    testWidgets('testing a ListArticleWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => const ListArticleWidget(
              thumbnail: "image",
              title: "title",
              author: "author",
              publishedDate: "publishedDate",
            ),
          ),
        ),
      );

      final circleimg = find.byType(CircularNetworkImage);
      final titletxt = find.text("title");
      final authortxt = find.text("author");
      final publishdate = find.text("publishedDate");
      final calendarIcon = find.byIcon(Icons.calendar_today);
      final chevronIcon = find.byIcon(CupertinoIcons.chevron_forward);

      expect(circleimg, findsOneWidget);
      expect(titletxt, findsOneWidget);
      expect(authortxt, findsOneWidget);
      expect(publishdate, findsOneWidget);
      expect(calendarIcon, findsOneWidget);
      expect(chevronIcon, findsOneWidget);
    });
  });
}
