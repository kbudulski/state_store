// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/features/home/cubit/home_cubit.dart';
import 'package:bloc_app/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomeCubit(),
          child: MaterialApp(home: HomePage()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
