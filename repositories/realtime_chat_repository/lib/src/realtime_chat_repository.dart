import 'package:firebase_dependencies/firebase_dependencies.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:shared_dependencies/shared_tech_dependencies.dart';

class RealtimeChatRepository {
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref().child('messages');

  Future<Either<Exception, void>> saveMessage(ChatMessage message) async {
    try {
      await _messagesRef.push().set(message.toJson());
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Stream<List<ChatMessage>> getMessages() {
    return _messagesRef.onValue.map((event) {
      final messages = <ChatMessage>[];
      for (final element in event.snapshot.children) {
        messages.add(
          ChatMessage.fromJson(element.value! as Map<dynamic, dynamic>),
        );
      }
      return messages;
    });
  }
}
