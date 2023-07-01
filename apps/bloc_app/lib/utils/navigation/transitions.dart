import 'package:flutter/material.dart';

Widget slideTransition(
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(1, 0);
  const end = Offset.zero;
  const curve = Curves.ease;

  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
