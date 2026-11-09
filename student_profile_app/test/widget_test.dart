import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_profile_app/student_profile_app.dart';

void main() {
  testWidgets('Student profile displays the sample profile', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentProfileApp());

    expect(find.text('Student Profile'), findsOneWidget);
    expect(find.text('JD'), findsOneWidget);
    expect(find.text('Juan Dela Cruz'), findsOneWidget);
    expect(find.text('BS Information Technology'), findsOneWidget);
    expect(find.text('2026-00123'), findsOneWidget);
    expect(find.text('2nd Year - IT2A'), findsOneWidget);
    expect(find.text('juan@example.com'), findsOneWidget);
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Hobbies and Interests'), findsOneWidget);
    expect(find.textContaining('mobile developer'), findsOneWidget);
    expect(find.text('Coding'), findsOneWidget);
    expect(find.text('Reading'), findsOneWidget);
    expect(find.text('Badminton'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byIcon(Icons.badge), findsOneWidget);
  });
}
