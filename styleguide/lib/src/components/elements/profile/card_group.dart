import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class CardGroup extends StatelessWidget {
  const CardGroup({required this.cards, super.key});

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: radius(Dimens.size24),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.primaryColor,
          borderRadius: radius(Dimens.size24),
        ),
        child: ListView.separated(
          itemCount: cards.length,
          itemBuilder: (_, index) => cards[index],
          separatorBuilder: (context, index) => _buildDivider(context),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ScrollPhysics(),
        ),
      ),
    );
  }

  Divider _buildDivider(BuildContext context) {
    return Divider(
      height: 0,
      color: Theme.of(context).primaryColorLight.withOpacity(0.5),
      indent: Dimens.size60,
      endIndent: Dimens.size16,
    );
  }
}
