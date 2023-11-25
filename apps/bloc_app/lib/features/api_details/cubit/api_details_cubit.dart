import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_dependencies/welltested.dart';

part 'api_details_state.dart';

@Welltested()
class ApiDetailsCubit extends Cubit<ApiDetailsState> {
  ApiDetailsCubit(this._apiRepository) : super(const ApiDetailsLoading());

  final ApiRepository _apiRepository;

  @Testcases([
    'Should return details when fetch is successful',
    'Should return error when fetch fails'
  ])
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
