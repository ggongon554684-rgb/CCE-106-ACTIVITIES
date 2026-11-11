// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gongon_calculator/main.dart' as app;

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const app.CalculatorApp());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Calculation result displays input values', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const app.CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '124');
    await tester.enterText(find.byType(TextField).at(1), '41');
    await tester.tap(find.text('×'));
    await tester.pumpAndSettle();

    expect(find.text('Result: 124 × 41 = 5084.0'), findsOneWidget);
    expect(find.text('5084.0'), findsOneWidget);
  });
}
