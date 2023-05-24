import 'package:driver_license_test/data/model/base_list_response.dart';

abstract class ApiService {
  Future<BaseListResponse> getUpcomingMovies();

  Future<BaseListResponse> getPopularMovies();

  Future<BaseListResponse> getTopRateMovies();
}
