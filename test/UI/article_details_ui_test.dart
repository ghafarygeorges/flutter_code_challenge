import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/models/article_model.dart';
import 'package:flutter_coding_challenge/viewmodels/article_view_model.dart';
import 'package:flutter_coding_challenge/views/article_details_view.dart';
import 'package:flutter_coding_challenge/widgets/regular_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Text UI tests', () {
    testWidgets('test text components number', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final allTexts = find.byType(Text);
      expect(allTexts, findsNWidgets(7));
    });

    testWidgets('test text abstract', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final abstractText = find.text("abstract");
      expect(abstractText, findsOneWidget);
    });

    testWidgets('test text title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final titleText = find.text("title");
      expect(titleText, findsOneWidget);
    });

    testWidgets('test text author', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final authorText = find.text("author");
      expect(authorText, findsOneWidget);
    });

    testWidgets('test text publish date', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final publishText = find.text("date");
      expect(publishText, findsOneWidget);
    });

    testWidgets('test text section', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(393, 760),
            builder: () => ArticleDetailsView(
              articleViewModel: ArticleViewModel(
                article: ArticleModel(
                  abstract: "abstract",
                  author: "author",
                  id: 100,
                  image: "image",
                  publishedDate: "date",
                  section: "section",
                  thumbnail: "thumbnail",
                  title: "title",
                ),
              ),
            ),
          ),
        ),
      );
      final sectionText = find.text("section");
      expect(sectionText, findsOneWidget);
    });
  });

  testWidgets('test appbar availability', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(393, 760),
          builder: () => ArticleDetailsView(
            articleViewModel: ArticleViewModel(
              article: ArticleModel(
                abstract: "abstract",
                author: "author",
                id: 100,
                image: "image",
                publishedDate: "date",
                section: "section",
                thumbnail: "thumbnail",
                title: "title",
              ),
            ),
          ),
        ),
      ),
    );
    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });

  testWidgets('test image availability', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(393, 760),
          builder: () => ArticleDetailsView(
            articleViewModel: ArticleViewModel(
              article: ArticleModel(
                abstract: "abstract",
                author: "author",
                id: 100,
                image: "image",
                publishedDate: "date",
                section: "section",
                thumbnail: "thumbnail",
                title: "title",
              ),
            ),
          ),
        ),
      ),
    );
    final image = find.byType(RegularNetworkImage);
    expect(image, findsOneWidget);
  });

  testWidgets('test row availability', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(393, 760),
          builder: () => ArticleDetailsView(
            articleViewModel: ArticleViewModel(
              article: ArticleModel(
                abstract: "abstract",
                author: "author",
                id: 100,
                image: "image",
                publishedDate: "date",
                section: "section",
                thumbnail: "thumbnail",
                title: "title",
              ),
            ),
          ),
        ),
      ),
    );
    final row = find.byType(Row);
    expect(row, findsOneWidget);
  });

  testWidgets('test Column availability', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(393, 760),
          builder: () => ArticleDetailsView(
            articleViewModel: ArticleViewModel(
              article: ArticleModel(
                abstract: "abstract",
                author: "author",
                id: 100,
                image: "image",
                publishedDate: "date",
                section: "section",
                thumbnail: "thumbnail",
                title: "title",
              ),
            ),
          ),
        ),
      ),
    );
    final column = find.byType(Column);
    expect(column, findsOneWidget);
  });

  testWidgets('test sizedbox item count', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(393, 760),
          builder: () => ArticleDetailsView(
            articleViewModel: ArticleViewModel(
              article: ArticleModel(
                abstract: "abstract",
                author: "author",
                id: 100,
                image: "image",
                publishedDate: "date",
                section: "section",
                thumbnail: "thumbnail",
                title: "title",
              ),
            ),
          ),
        ),
      ),
    );
    final sizedBox = find.byType(SizedBox);
    expect(sizedBox, findsNWidgets(7));
  });
}
