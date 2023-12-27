import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:styleguide/components.dart';

void main() {
  group('AppCard Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'app_card',
      builder: () => GoldenTestGroup(
        columnWidthBuilder: (_) => const FixedColumnWidth(300),
        children: [
          GoldenTestScenario(
            name: 'with basic configuration',
            child: const AppListTile(
              icon: Icons.lightbulb_circle,
              title: 'title',
            ),
          ),
          GoldenTestScenario(
            name: 'with custom trailing icon',
            child: const AppListTile(
              icon: Icons.flag_circle,
              title: 'title',
              trailing: Icon(Icons.arrow_outward, color: Colors.red),
            ),
          ),
          GoldenTestScenario(
            name: 'with title and subtitle',
            child: const AppListTile(
              icon: Icons.add_circle,
              title: 'title',
              subtitle: 'subtitle',
            ),
          ),
          GoldenTestScenario(
            name: 'with custom colors',
            child: const AppListTile(
              icon: Icons.cloud_circle,
              title: 'title',
              subtitle: 'subtitle',
              iconBackgroundColor: Colors.red,
              tileColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  });
}
