// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';

import 'package:itapp/main.dart';

void main() {
  testWidgets('Portfolio content is visible on a mobile screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    expect(find.text("HELLO, I'M"), findsOneWidget);
    expect(find.text('Ogie M.\nEntrecoso'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
