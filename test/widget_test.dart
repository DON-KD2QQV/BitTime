import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:binary_clock_web_app/main.dart';

void main() {
  testWidgets('Binary Clock Web App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BinaryClockWebApp()); // ← Changed from MyApp

    // Verify that the app builds without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Look for the app bar title
    expect(find.text('Binary Clock'), findsOneWidget);
    
    // Verify basic structure exists
    expect(find.byType(Scaffold), findsOneWidget);
  });
}