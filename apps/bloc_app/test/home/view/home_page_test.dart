// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage', () {
    group('route', () {
      test('is routable', () {
        // expect(HomePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
