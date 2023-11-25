part of 'api_details_cubit.dart';

sealed class ApiDetailsState extends Equatable {
  const ApiDetailsState();

  @override
  List<Object> get props => [];
}

class ApiDetailsLoading extends ApiDetailsState {
  const ApiDetailsLoading();
}

class ApiDetailsError extends ApiDetailsState {
  const ApiDetailsError();
}

class ApiDetailsLoaded extends ApiDetailsState {
  const ApiDetailsLoaded(this.plantDetails);

  final PlantDetails plantDetails;

  @override
  List<Object> get props => [plantDetails];
}
