import 'package:flutter/material.dart';
import 'package:shared_dependencies/grouped_list.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class MessageList extends StatelessWidget {
  MessageList({required this.messages, super.key});

  final List<UIMessage> messages;
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom(_) {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_scrollToBottom);
    return GroupedListView(
      padding: const EdgeInsets.only(
        left: Dimens.size16,
        right: Dimens.size16,
        bottom: Dimens.size12,
      ),
      elements: messages,
      separator: AppSpaces.gap12,
      groupBy: (message) => DateTime(
        message.date.year,
        message.date.month,
        message.date.day,
      ),
      order: GroupedListOrder.DESC,
      reverse: true,
      floatingHeader: true,
      groupHeaderBuilder: (message) => _buildHeader(context, message: message),
      itemBuilder: _buildChatBubble,
    );
  }

  Widget _buildHeader(BuildContext context, {required UIMessage message}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.size12),
        child: Text(
          getFormattedDate(message.date),
          style: context.textTheme.labelSmall?.copyWith(
            color: context.color.onBackground.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(_, UIMessage message) {
    if (message.sentByCurrentUser) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Flexible(
            flex: 5,
            child: ChatBubble(
              userName: message.name,
              text: message.text,
              sentByCurrentUser: true,
              date: message.date,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Flexible(
            flex: 5,
            child: ChatBubble(
              userName: message.name,
              text: message.text,
              sentByCurrentUser: false,
              date: message.date,
            ),
          ),
          const Spacer(),
        ],
      );
    }
  }
}
