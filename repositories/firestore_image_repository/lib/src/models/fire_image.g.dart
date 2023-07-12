// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireImage _$FireImageFromJson(Map<String, dynamic> json) => FireImage(
      url: json['url'] as String,
      userName: json['userName'] as String,
      userId: json['userId'] as String,
      createdOn:
          const TimestampConverter().fromJson(json['createdOn'] as Timestamp),
      description: json['description'] as String,
      fileName: json['fileName'] as String,
      size: json['size'] as int,
    );

Map<String, dynamic> _$FireImageToJson(FireImage instance) => <String, dynamic>{
      'url': instance.url,
      'userName': instance.userName,
      'userId': instance.userId,
      'createdOn': const TimestampConverter().toJson(instance.createdOn),
      'description': instance.description,
      'fileName': instance.fileName,
      'size': instance.size,
    };
