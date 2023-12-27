// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_app/use_cases/components/elements/app_card_uc.dart'
    as _i2;
import 'package:widgetbook_app/use_cases/components/pages/home_page_uc.dart'
    as _i3;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'elements',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AppCard',
            useCase: _i1.WidgetbookUseCase(
              name: 'app card',
              builder: _i2.appCardUseCase,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'pages',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'HomePage',
            useCase: _i1.WidgetbookUseCase(
              name: 'home page',
              builder: _i3.homePageUseCase,
            ),
          )
        ],
      ),
    ],
  )
];
