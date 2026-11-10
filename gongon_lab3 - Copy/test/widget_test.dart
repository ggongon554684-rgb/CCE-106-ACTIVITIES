import 'package:flutter_test/flutter_test.dart';

import 'package:gongon_lab3/main.dart';

void main() {
  testWidgets('login screen displays the auth form', (tester) async {
    await tester.pumpWidget(const LoginRegisterApp());

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Create an account'), findsOneWidget);
  });
}
