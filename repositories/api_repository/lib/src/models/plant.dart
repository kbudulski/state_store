import 'package:api_repository/src/models/photo.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Plant {
  Plant({
    this.id,
    this.commonName,
    this.scientificName,
    this.otherName,
    this.cycle,
    this.watering,
    this.sunlight,
    this.defaultImage,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);

  int? id;
  String? commonName;
  List<String>? scientificName;
  List<String>? otherName;
  @JsonKey(unknownEnumValue: Cycle.unknown)
  Cycle? cycle;
  Watering? watering;
  @JsonKey(unknownEnumValue: Sunlight.unknown)
  List<Sunlight>? sunlight;
  Photo? defaultImage;
}

@JsonEnum(fieldRename: FieldRename.pascal)
enum Cycle {
  perennial,
  annual,
  biennial,
  biannual,
  unknown,
}

@JsonEnum(fieldRename: FieldRename.pascal)
enum Watering {
  frequent(Icons.water),
  average(Icons.water_drop),
  minimum(Icons.opacity),
  none(Icons.water_drop_outlined);

  const Watering(this.icon);

  final IconData icon;
}

@JsonEnum()
enum Sunlight {
  @JsonValue('full shade')
  fullShade(Icons.nightlight, Colors.indigoAccent),
  @JsonValue('part shade')
  partShade(Icons.cloud, Colors.blueGrey),
  @JsonValue('part sun/part shade')
  partShadePartSun(Icons.brightness_6, Colors.orangeAccent),
  @JsonValue('full sun')
  fullSun(Icons.sunny, Colors.amber),
  unknown(Icons.help, Colors.grey);

  const Sunlight(this.icon, this.color);

  final IconData icon;
  final Color color;
}
