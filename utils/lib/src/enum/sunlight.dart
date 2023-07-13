import 'package:flutter/material.dart';

enum Sunlight {
  fullShade(Icons.nightlight, Colors.indigoAccent),
  partShade(Icons.cloud, Colors.blueGrey),
  partShadePartSun(Icons.brightness_6, Colors.orangeAccent),
  fullSun(Icons.sunny, Colors.amber),
  unknown(Icons.help, Colors.grey);

  const Sunlight(this.icon, this.color);

  final IconData icon;
  final Color color;
}
