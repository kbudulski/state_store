import 'package:api_repository/src/models/photo.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@CustomSunlightConverter()
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

enum Sunlight {
  fullShade(Icons.nightlight, Colors.indigoAccent),
  partShade(Icons.cloud, Colors.blueGrey),
  partShadePartSun(Icons.brightness_6, Colors.orangeAccent),
  fullSun(Icons.sunny, Colors.amber),
  unknown(Icons.help, Colors.grey);

  const Sunlight(this.icon, this.color);

  final IconData icon;
  final Color color;
}

class CustomSunlightConverter
    implements JsonConverter<List<Sunlight>, List<dynamic>> {
  const CustomSunlightConverter();

  @override
  List<Sunlight> fromJson(List<dynamic> json) {
    final list = json.map((e) => e as String).toList();
    if (json.isEmpty) return [Sunlight.unknown];

    return list
        .map((element) {
          if (element.toLowerCase().contains(RegExp('full.*shade'))) {
            return Sunlight.fullShade;
          }
          if (element.toLowerCase().contains(RegExp('full.*sun'))) {
            return Sunlight.fullSun;
          }
          if (element.toLowerCase().contains(RegExp('part.*sun.*shade'))) {
            return Sunlight.partShadePartSun;
          }
          if (element.toLowerCase().contains(RegExp('part|filter.*shade'))) {
            return Sunlight.partShade;
          }
          return Sunlight.unknown;
        })
        .toSet()
        .toList();
  }

  @override
  List<String> toJson(List<Sunlight> json) => [];
}
