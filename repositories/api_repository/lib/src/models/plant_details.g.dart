// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantDetails _$PlantDetailsFromJson(Map<String, dynamic> json) => PlantDetails(
      id: json['id'] as int?,
      commonName: json['common_name'] as String?,
      scientificName: (json['scientific_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      defaultImage: json['default_image'] == null
          ? null
          : Photo.fromJson(json['default_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlantDetailsToJson(PlantDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'description': instance.description,
      'default_image': instance.defaultImage,
    };
