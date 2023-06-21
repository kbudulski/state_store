import 'package:bloc_app/features/settings/help/cubit/help_cubit.dart';
import 'package:bloc_app/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:styleguide/style.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({super.key});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    if (_textController.text.isEmpty) return;
    context.read<HelpCubit>().sendMessage(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Dimens.size08,
        top: Dimens.size08,
        right: Dimens.size08,
        bottom: Dimens.size12,
      ),
      child: IgnorePointer(
        ignoring: context.read<HelpCubit>().hasError,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.size12),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: 'Enter new message',
                    fillColor: context.color.inversePrimary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: radius(Dimens.size32),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Dimens.size16,
                      vertical: Dimens.size08,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  controller: _textController,
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: context.color.primary),
              onPressed: _sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
