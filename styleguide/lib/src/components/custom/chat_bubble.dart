import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.userName,
    required this.text,
    required this.date,
    required this.sentByCurrentUser,
    super.key,
  });

  final String userName;
  final String text;
  final DateTime date;
  final bool sentByCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!sentByCurrentUser) _buildUserName(context),
        _buildMessage(context),
        _buildTimeSentInfo(context),
      ],
    );
  }

  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size12,
        bottom: Dimens.size04,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          userName.split(' ').first,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.color.onBackground.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Align(
      alignment: sentByCurrentUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size12,
          vertical: Dimens.size08,
        ),
        decoration: BoxDecoration(
          borderRadius: radius(Dimens.size16),
          color: sentByCurrentUser
              ? context.color.secondary
              : context.color.primary,
        ),
        child: Text(
          text,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.color.onPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSentInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size12,
        right: Dimens.size12,
        top: Dimens.size04,
      ),
      child: Align(
        alignment: sentByCurrentUser ? Alignment.topRight : Alignment.topLeft,
        child: Text(
          getFormattedTime(date),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.color.onBackground.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
