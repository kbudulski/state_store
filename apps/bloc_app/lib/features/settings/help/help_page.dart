import 'package:bloc_app/features/settings/help/cubit/help_cubit.dart';
import 'package:bloc_app/features/settings/help/widgets/message_input.dart';
import 'package:bloc_app/features/settings/help/widgets/message_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HelpCubit(
        realtimeChatRepository: context.read(),
        authRepository: context.read(),
      ),
      child: const HelpView(),
    );
  }
}

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Help')),
        body: Column(
          children: [
            Expanded(child: MessageList()),
            const MessageInput(),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
