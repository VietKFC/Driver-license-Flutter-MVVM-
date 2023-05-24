import 'package:driver_license_test/data/model/base_list_response.dart';
import 'package:injectable/injectable.dart';

import '../service/api_service.dart';

@lazySingleton
class MovieRepository {
  final ApiService _apiService;

  MovieRepository(this._apiService);

  Future<BaseListResponse> getUpcomingMovies() =>
      _apiService.getUpcomingMovies();

  Future<BaseListResponse> getPopularMovies() => _apiService.getPopularMovies();

  Future<BaseListResponse> getTopRateMovies() => _apiService.getTopRateMovies();
}
