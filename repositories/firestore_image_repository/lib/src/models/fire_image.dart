import 'package:firebase_dependencies/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fire_image.g.dart';

@JsonSerializable()
@TimestampConverter()
class FireImage {
  const FireImage({
    required this.url,
    required this.userName,
    required this.userId,
    required this.createdOn,
    required this.description,
    required this.fileName,
    required this.size,
  });

  factory FireImage.fromJson(Map<String, dynamic> json) =>
      _$FireImageFromJson(json);

  Map<String, dynamic> toJson() => _$FireImageToJson(this);

  final String url;
  final String userName;
  final String userId;
  final DateTime createdOn;
  final String description;
  final String fileName;
  final int size;
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp value) => value.toDate();

  @override
  Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}
