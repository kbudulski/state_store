// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      imageId: json['image_id'] as int?,
      license: json['license'] as int?,
      licenseName: json['license_name'] as String?,
      licenseUrl: json['license_url'] as String?,
      originalUrl: json['original_url'] as String?,
      regularUrl: json['regular_url'] as String?,
      mediumUrl: json['medium_url'] as String?,
      smallUrl: json['small_url'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'image_id': instance.imageId,
      'license': instance.license,
      'license_name': instance.licenseName,
      'license_url': instance.licenseUrl,
      'original_url': instance.originalUrl,
      'regular_url': instance.regularUrl,
      'medium_url': instance.mediumUrl,
      'small_url': instance.smallUrl,
      'thumbnail': instance.thumbnail,
    };
