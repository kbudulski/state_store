import 'package:api_repository/api_repository.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: 'https://perenual.com/api/')
abstract class ApiRepository {
  factory ApiRepository(Dio dio) = _ApiRepository;

  @GET('species-list?compress=true')
  Future<Plants> getPlants({
    @Query('page') required int page,
    @Query('q') String? query,
    @Query('watering') String? watering,
    @Query('sunlight') String? sunlight,
  });

  @GET('species/details/{id}')
  Future<PlantDetails> getPlantDetails({
    @Path('id') required String id,
  });
}
