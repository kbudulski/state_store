import 'package:firebase_dependencies/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
@TimestampConverter()
class Post {
  const Post({
    required this.text,
    required this.userName,
    required this.photoUrl,
    required this.date,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  final String text;
  final String userName;
  final String photoUrl;
  final DateTime date;
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp value) => value.toDate();

  @override
  Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}
