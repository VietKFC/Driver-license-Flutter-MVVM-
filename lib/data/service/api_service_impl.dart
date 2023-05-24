import 'package:dio/dio.dart';
import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/service/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../model/base_list_response.dart';

part 'api_service_impl.g.dart';

@RestApi()
@Injectable(as: ApiService)
abstract class ApiServiceImpl extends ApiService {
  @factoryMethod
  factory ApiServiceImpl(Dio dio, {@Named("baseUrl") required String baseUrl}) =
      _ApiServiceImpl;

  @override
  @GET('/movie/upcoming')
  Future<BaseListResponse> getUpcomingMovies();

  @override
  @GET('/movie/popular')
  Future<BaseListResponse> getPopularMovies();

  @override
  @GET('/movie/top_rated')
  Future<BaseListResponse> getTopRateMovies();
}
