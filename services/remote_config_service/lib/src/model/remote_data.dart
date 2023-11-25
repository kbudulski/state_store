import 'package:json_annotation/json_annotation.dart';

part 'remote_data.g.dart';

@JsonSerializable(createToJson: false)
class RemoteData {
  RemoteData({
    required this.premium,
    required this.photo,
  });

  factory RemoteData.fromJson(Map<String, dynamic> json) =>
      _$RemoteDataFromJson(json);

  final bool premium;
  final String photo;
}
