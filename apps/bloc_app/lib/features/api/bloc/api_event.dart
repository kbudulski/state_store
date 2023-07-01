part of 'api_bloc.dart';

sealed class ApiEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PlantsFetched extends ApiEvent {}

final class PlantsSearched extends ApiEvent {
  PlantsSearched(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class PlantsFiltered extends ApiEvent {
  PlantsFiltered({
    required this.sunFilter,
    required this.waterFilter,
  });

  final SunlightFilter? sunFilter;
  final WateringFilter? waterFilter;
}
