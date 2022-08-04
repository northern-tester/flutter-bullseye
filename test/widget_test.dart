// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bullseye/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GamePage has text of Bullseye', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);

    final textFinder = find.text('PUT THE BULLSEYE AS CLOSE AS YOU CAN TO');

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
    final popUpText = find.text('The slider\'s value is 50');
    expect(popUpText, findsOneWidget);

    final awesome = find.text('Awesome!');
    await tester.tap(awesome);
    await tester.pump();
    expect(popUpText, findsNothing);
  });

  testWidgets('Gamepage has a moving slider', (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);
    await tester.tap(find.byType(Slider));
    await tester.drag(find.byType(Slider), const Offset(5.0, 0.0));
  });

  testWidgets('Round is incremented when hit me button is pressed',
      (WidgetTester tester) async {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(), child: MaterialApp(home: GamePage()));

    await tester.pumpWidget(testWidget);

    final initialRound = find.text('Round: 1');
    expect(initialRound, findsOneWidget);

    final button = find.text('Hit me');
    await tester.tap(button);
    await tester.pump();

    final awesome = find.text('Awesome!');
    await tester.tap(awesome);
    await tester.pump();

    final nextRound = find.text('Round: 2');
    expect(nextRound, findsOneWidget);
  });
}
