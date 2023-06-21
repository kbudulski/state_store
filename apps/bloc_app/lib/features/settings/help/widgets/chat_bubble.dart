import 'package:bloc_app/features/settings/help/cubit/ui_message.dart';
import 'package:bloc_app/utils/date_formatters.dart';
import 'package:bloc_app/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:styleguide/style.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, {super.key});

  final UIMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!message.sentByCurrentUser) _buildUserName(context),
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
          message.name.split(' ').first,
          style: context.textTheme.labelSmall?.copyWith(
            color: context.color.onBackground.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context) {
    return Align(
      alignment:
          message.sentByCurrentUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size12,
          vertical: Dimens.size08,
        ),
        decoration: BoxDecoration(
          borderRadius: radius(Dimens.size16),
          color: message.sentByCurrentUser
              ? context.color.secondary
              : context.color.primary,
        ),
        child: Text(
          message.text,
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
        alignment:
            message.sentByCurrentUser ? Alignment.topRight : Alignment.topLeft,
        child: Text(
          getFormattedTime(message.date),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.color.onBackground.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
