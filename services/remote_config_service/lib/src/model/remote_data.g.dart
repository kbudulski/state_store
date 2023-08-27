// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteData _$RemoteDataFromJson(Map<String, dynamic> json) => RemoteData(
      premium: json['premium'] as bool,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$RemoteDataToJson(RemoteData instance) =>
    <String, dynamic>{
      'premium': instance.premium,
      'photo': instance.photo,
    };
