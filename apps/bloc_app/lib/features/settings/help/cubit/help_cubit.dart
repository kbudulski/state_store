import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:utils/utils.dart';

part 'help_cubit.freezed.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit({
    required this.realtimeChatRepository,
    required this.authRepository,
  }) : super(const HelpState()) {
    realtimeChatRepository.getMessages().listen(
          _emitMessages,
          onError: (_) => _emitError(Exception('Error getting messages')),
        );
  }

  final RealtimeChatRepository realtimeChatRepository;
  final AuthenticationRepository authRepository;

  bool get hasError => state.error != null;

  void _emitMessages(List<ChatMessage> data) {
    final messages = <UIMessage>[];
    for (final message in data) {
      messages.add(
        UIMessage(
          name: message.name,
          text: message.text,
          date: message.date,
          sentByCurrentUser: message.uid == authRepository.currentUser.id,
        ),
      );
    }
    emit(HelpState(messages: messages, isLoading: false));
  }

  Future<void> sendMessage(String message) async {
    final response = await realtimeChatRepository.saveMessage(
      ChatMessage(
        text: message,
        date: DateTime.now(),
        name: authRepository.currentUser.name ?? 'Anonymous',
        uid: authRepository.currentUser.id,
      ),
    );
    response.fold(_emitError, (_) {});
  }

  void _emitError(Exception e) {
    emit(state.copyWith(error: e, isLoading: false));
  }
}

@freezed
class HelpState with _$HelpState {
  const factory HelpState({
    @Default([]) List<UIMessage> messages,
    @Default(true) bool isLoading,
    Exception? error,
  }) = _HelpState;
}
