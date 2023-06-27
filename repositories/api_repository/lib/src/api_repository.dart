import 'package:api_repository/src/models/plants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: 'https://perenual.com/api/')
abstract class ApiRepository {
  factory ApiRepository(Dio dio, {String baseUrl}) = _ApiRepository;

  @GET('species-list')
  Future<Plants> getPlants({
    @Query('page') required int page,
    @Query('q') String? query,
    @Query('watering') String? watering,
    @Query('sunlight') String? sunlight,
  });
}
