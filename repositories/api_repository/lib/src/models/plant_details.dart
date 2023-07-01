import 'package:api_repository/src/models/photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PlantDetails {
  PlantDetails({
    this.id,
    this.commonName,
    this.scientificName,
    this.description,
    this.defaultImage,
  });

  factory PlantDetails.fromJson(Map<String, dynamic> json) =>
      _$PlantDetailsFromJson(json);

  int? id;
  String? commonName;
  List<String>? scientificName;
  String? description;
  Photo? defaultImage;
}
