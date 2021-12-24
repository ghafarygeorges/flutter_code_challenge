import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
    final iconButton = find.byType(IconButton);

    await tester.pumpWidget(const MyApp());
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
}
