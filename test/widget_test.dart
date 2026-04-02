import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navigations_complete/main.dart';

void main() {
  Future<void> pumpAppWithSize(
    WidgetTester tester, {
    required Size size,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
  }

  testWidgets('uses the mobile navigation flow on narrow screens', (
    WidgetTester tester,
  ) async {
    await pumpAppWithSize(tester, size: const Size(600, 900));

    expect(find.text('Home Mobile'), findsOneWidget);
    expect(find.text('Home Web'), findsNothing);

    await tester.tap(find.widgetWithText(MaterialButton, 'Go to about'));
    await tester.pumpAndSettle();

    expect(find.text('About Mobile'), findsOneWidget);
    expect(find.textContaining('Paulina Knop'), findsOneWidget);

    await tester.tap(find.widgetWithText(MaterialButton, 'Go back'));
    await tester.pumpAndSettle();

    expect(find.text('Home Mobile'), findsOneWidget);
  });

  testWidgets('uses the web navigation flow on wide screens', (
    WidgetTester tester,
  ) async {
    await pumpAppWithSize(tester, size: const Size(1200, 900));

    expect(find.text('Home Web'), findsOneWidget);
    expect(find.text('Home Mobile'), findsNothing);

    await tester.tap(find.widgetWithText(MaterialButton, 'Go to about'));
    await tester.pumpAndSettle();

    expect(find.text('About Web'), findsOneWidget);
    expect(find.textContaining('Paulina Knop'), findsOneWidget);

    await tester.tap(find.widgetWithText(MaterialButton, 'Go back'));
    await tester.pumpAndSettle();

    expect(find.text('Home Web'), findsOneWidget);
  });
}
