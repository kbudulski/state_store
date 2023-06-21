import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable(anyMap: true)
class ChatMessage {
  ChatMessage({
    required this.name,
    required this.uid,
    required this.text,
    required this.date,
  });

  factory ChatMessage.fromJson(Map<dynamic, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  final String name;
  final String uid;
  final String text;
  final DateTime date;
}
