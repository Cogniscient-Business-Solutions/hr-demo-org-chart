import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:providerriverpodstate/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Provide isLoggedIn: false so it loads the login screen
    await tester.pumpWidget(MyApp(isLoggedIn: false));

    // Example: check if login button exists instead of counter
    expect(find.text('Login'), findsOneWidget);
  });
}
