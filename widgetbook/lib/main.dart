import 'package:flutter/material.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:styleguide/style.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_app/main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
          ],
          initialDevice: Devices.ios.iPhone13,
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppTheme.light(FlexScheme.aquaBlue),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: AppTheme.dark(FlexScheme.indigo),
            ),
          ],
        ),
        AlignmentAddon(),
        TextScaleAddon(scales: [1, 2], initialScale: 1),
        ZoomAddon(),
      ],
    );
  }
}
