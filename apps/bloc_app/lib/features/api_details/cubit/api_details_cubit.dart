import 'package:api_repository/api_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'api_details_state.dart';

class ApiDetailsCubit extends Cubit<ApiDetailsState> {
  ApiDetailsCubit(this._apiRepository) : super(const ApiDetailsLoading());

  final ApiRepository _apiRepository;

  Future<void> fetchPlantDetails(String id) async {
    emit(const ApiDetailsLoading());
    try {
      final response = await _apiRepository.getPlantDetails(id: id);
      emit(ApiDetailsLoaded(response));
    } catch (_) {
      emit(const ApiDetailsError());
    }
  }
}
