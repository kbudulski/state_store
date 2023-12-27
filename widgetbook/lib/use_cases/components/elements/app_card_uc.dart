import 'package:flutter/material.dart';
import 'package:styleguide/components.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'app card',
  type: AppCard,
)
Widget appCardUseCase(BuildContext context) {
  return AppCard(
    title: context.knobs.string(
      label: 'title',
      initialValue: 'Title',
    ),
    coloredLabel: context.knobs.string(
      label: 'colored label',
      initialValue: 'Label',
    ),
    icon: Icons.account_balance,
    description: context.knobs.string(
      label: 'description',
      initialValue: 'Description',
    ),
    image: '../assets/sample.jpg',
    overlayColor: Colors.deepOrangeAccent,
    onTap: context.knobs.boolean(label: 'disable') ? null : () {},
  );
}
