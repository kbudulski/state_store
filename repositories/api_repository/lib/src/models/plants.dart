import 'package:api_repository/src/models/plant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plants.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Plants {
  Plants({
    this.data,
    this.to,
    this.perPage,
    this.currentPage,
    this.from,
    this.lastPage,
    this.total,
  });

  factory Plants.fromJson(Map<String, dynamic> json) => _$PlantsFromJson(json);

  List<Plant>? data;
  int? to;
  int? perPage;
  int? currentPage;
  int? from;
  int? lastPage;
  int? total;
}
