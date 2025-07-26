import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:binary_clock_web_app/main.dart';

void main() {
  testWidgets('Binary Clock Web App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BinaryClockWebApp());

    // Verify that the app builds without crashing
    expect(find.byType(MaterialApp), findsOneWidget);

    // Look for the app bar title
    expect(find.text('BitTime - RadioOperator.net'), findsOneWidget);

    // Verify basic structure exists
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
