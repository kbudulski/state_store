import 'package:bloc_app/features/settings/help/cubit/help_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:styleguide/components.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HelpCubit(
        realtimeChatRepository: context.read(),
        authService: context.read(),
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
            Expanded(
              child: BlocBuilder<HelpCubit, HelpState>(
                builder: (_, state) {
                  if (state.isLoading) {
                    return const AppSpinner();
                  }
                  if (state.error != null) {
                    return const ErrorMessage('Something went wrong');
                  }
                  if (state.messages.isNotEmpty) {
                    return MessageList(messages: state.messages);
                  }
                  return Center(
                    child: Text(
                      'No messages yet',
                      style: context.textTheme.headlineMedium,
                    ),
                  );
                },
              ),
            ),
            AppMessageInput(
              onSendMessage: context.read<HelpCubit>().sendMessage,
              hasError: context.select((HelpCubit cubit) => cubit.hasError),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}
