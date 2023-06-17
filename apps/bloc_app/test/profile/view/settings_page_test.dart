// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/features/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfilePage', () {
    group('route', () {
      test('is routable', () {
        // expect(ProfilePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ProfileView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPage()));
      expect(find.byType(SettingsPage), findsOneWidget);
    });
  });
}
