// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('displays the fixed water tracker screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;

    await tester.pumpWidget(const WaterTrackerApp());

    expect(find.text('Water Tracker'), findsOneWidget);
    expect(find.byIcon(Icons.water_drop), findsOneWidget);
    expect(find.text('Stay Hydrated!'), findsOneWidget);
    expect(find.text('Build a healthy daily habit'), findsOneWidget);
    expect(find.text('Daily Water Goal'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('glasses per day'), findsOneWidget);
    expect(find.text('Drink water regularly'), findsOneWidget);
    expect(find.text('Bring your water bottle'), findsOneWidget);
    expect(find.text('Every glass counts!'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
