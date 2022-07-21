// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:js';
import 'dart:math';

import 'package:bullseye/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GamePage has text of Bullseye', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);

    final textFinder = find.text('Bullseye');

    expect(textFinder, findsOneWidget);
  });

  testWidgets('GamePage has button with text hit me',
      (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);

    final buttonTextFinder = find.text('Hit me');

    expect(buttonTextFinder, findsOneWidget);
  });

  testWidgets('Gamepage has a dialog after button press',
      (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);
    final button = find.text('Hit me');

    await tester.tap(button);
    await tester.pump();
    final popUpText = find.text('This is my first pop-up!');
    expect(popUpText, findsOneWidget);

    final awesome = find.text('Awesome!');
    await tester.tap(awesome);
    await tester.pump();
    expect(popUpText, findsNothing);
  });

  testWidgets('GamePage is in landscape only', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    // ignore: todo
    //TODO - set screen size to portrait and check orientattion

    await tester.pumpWidget(testWidget);
  });
}
