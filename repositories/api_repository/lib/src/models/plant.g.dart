// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plant _$PlantFromJson(Map<String, dynamic> json) => Plant(
      id: json['id'] as int?,
      commonName: json['common_name'] as String?,
      scientificName: (json['scientific_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      otherName: (json['other_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cycle: $enumDecodeNullable(_$CycleEnumMap, json['cycle'],
          unknownValue: Cycle.unknown),
      watering: $enumDecodeNullable(_$WateringEnumMap, json['watering']),
      sunlight: _$JsonConverterFromJson<List<dynamic>, List<Sunlight>>(
          json['sunlight'], const CustomSunlightConverter().fromJson),
      defaultImage: json['default_image'] == null
          ? null
          : Photo.fromJson(json['default_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlantToJson(Plant instance) => <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'other_name': instance.otherName,
      'cycle': _$CycleEnumMap[instance.cycle],
      'watering': _$WateringEnumMap[instance.watering],
      'sunlight': _$JsonConverterToJson<List<dynamic>, List<Sunlight>>(
          instance.sunlight, const CustomSunlightConverter().toJson),
      'default_image': instance.defaultImage,
    };

const _$CycleEnumMap = {
  Cycle.perennial: 'Perennial',
  Cycle.annual: 'Annual',
  Cycle.biennial: 'Biennial',
  Cycle.biannual: 'Biannual',
  Cycle.unknown: 'Unknown',
};

const _$WateringEnumMap = {
  Watering.frequent: 'Frequent',
  Watering.average: 'Average',
  Watering.minimum: 'Minimum',
  Watering.none: 'None',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
