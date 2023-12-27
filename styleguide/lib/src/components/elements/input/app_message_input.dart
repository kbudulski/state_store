import 'package:flutter/material.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/style.dart';

class AppMessageInput extends StatefulWidget {
  const AppMessageInput({
    required this.onSendMessage,
    required this.hasError,
    super.key,
  });

  final ValueChanged<String> onSendMessage;
  final bool hasError;

  @override
  State<AppMessageInput> createState() => _AppMessageInputState();
}

class _AppMessageInputState extends State<AppMessageInput> {
  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    if (_textController.text.isEmpty) return;
    widget.onSendMessage(_textController.text);
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
        ignoring: widget.hasError,
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
            ),
          ],
        ),
      ),
    );
  }
}
