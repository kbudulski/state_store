import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Photo {
  Photo({
    this.imageId,
    this.license,
    this.licenseName,
    this.licenseUrl,
    this.originalUrl,
    this.regularUrl,
    this.mediumUrl,
    this.smallUrl,
    this.thumbnail,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  int? imageId;
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;
}
