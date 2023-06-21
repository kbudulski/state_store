import 'package:bloc_app/features/settings/help/cubit/help_cubit.dart';
import 'package:bloc_app/features/settings/help/widgets/chat_bubble.dart';
import 'package:bloc_app/utils/date_formatters.dart';
import 'package:bloc_app/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:styleguide/style.dart';

class MessageList extends StatelessWidget {
  MessageList({super.key});

  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom(_) {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      builder: (_, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(
            child: Text(
              'Something went wrong',
              style: context.textTheme.headlineMedium?.copyWith(
                color: Colors.red,
              ),
            ),
          );
        }
        if (state.messages.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback(_scrollToBottom);
          return GroupedListView(
            padding: const EdgeInsets.only(
              left: Dimens.size16,
              right: Dimens.size16,
              bottom: Dimens.size12,
            ),
            elements: state.messages,
            separator: AppSpaces.gap12,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            order: GroupedListOrder.DESC,
            reverse: true,
            floatingHeader: true,
            groupHeaderBuilder: (message) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.size12),
                child: Text(
                  getFormattedDate(message.date),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.color.onBackground.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            itemBuilder: (_, message) {
              if (message.sentByCurrentUser) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Flexible(flex: 5, child: ChatBubble(message)),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Flexible(flex: 5, child: ChatBubble(message)),
                    const Spacer(),
                  ],
                );
              }
            },
          );
        }
        return Center(
          child: Text(
            'No messages yet',
            style: context.textTheme.headlineMedium,
          ),
        );
      },
    );
  }
}
