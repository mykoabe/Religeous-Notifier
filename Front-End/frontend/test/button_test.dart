import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/Screens/HomePage.dart';

// the testerWidget is used to create the WidgetTester for each test cases
void main() {
  formTests();
}

void formTests() {
  testWidgets("My widget has a title and message", (WidgetTester tester) async {
    await tester.pumpWidget(HomePage());
    final formFinder = find.byType(Container);
    expect(formFinder, findsOneWidget);
  });
}