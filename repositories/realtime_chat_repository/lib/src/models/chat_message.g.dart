// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map json) => ChatMessage(
      name: json['name'] as String,
      uid: json['uid'] as String,
      text: json['text'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'text': instance.text,
      'date': instance.date.toIso8601String(),
    };
