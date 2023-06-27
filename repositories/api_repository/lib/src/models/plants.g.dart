// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plants _$PlantsFromJson(Map<String, dynamic> json) => Plants(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Plant.fromJson(e as Map<String, dynamic>))
          .toList(),
      to: json['to'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PlantsToJson(Plants instance) => <String, dynamic>{
      'data': instance.data,
      'to': instance.to,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'from': instance.from,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
