import 'package:dio/dio.dart';
import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/model/show.dart';
import 'package:driver_license_test/data/service/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_service_impl.g.dart';

@RestApi()
@Injectable(as: ApiService)
abstract class ApiServiceImpl extends ApiService {
  @factoryMethod
  factory ApiServiceImpl(Dio dio, {required String baseUrl}) = _ApiServiceImpl;

  @override
  @GET('/trending')
  Future<List<Movie>> getTrendingMovies();

  @override
  @GET('/recent-movies')
  Future<List<Movie>> getRecentMovies();

  @override
  @GET('recent-shows')
  Future<List<Show>> getRecentShows();
}
