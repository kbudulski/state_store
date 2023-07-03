// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      text: json['text'] as String,
      userName: json['userName'] as String,
      photoUrl: json['photoUrl'] as String,
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'text': instance.text,
      'userName': instance.userName,
      'photoUrl': instance.photoUrl,
      'date': const TimestampConverter().toJson(instance.date),
    };
