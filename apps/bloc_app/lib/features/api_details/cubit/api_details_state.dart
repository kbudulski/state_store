part of 'api_details_cubit.dart';

sealed class ApiDetailsState {
  const ApiDetailsState();
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
}
