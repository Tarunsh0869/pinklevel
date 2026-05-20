import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinklevel/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify MaterialApp renders
    expect(find.byType(MaterialApp), findsOneWidget);

    // Pump through the 3-second splash timer to avoid pending timer error
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });
}
