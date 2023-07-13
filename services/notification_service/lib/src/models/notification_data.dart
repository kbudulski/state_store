import 'package:json_annotation/json_annotation.dart';

part 'notification_data.g.dart';

@JsonSerializable(createToJson: false)
class NotificationData {
  NotificationData({
    required this.path,
    required this.daily,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  final String? path;
  final String? daily;
}
