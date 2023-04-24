import 'package:driver_license_test/data/model/movie.dart';
import 'package:injectable/injectable.dart';

import '../service/api_service.dart';

@lazySingleton
class MovieRepository {
  final ApiService _apiService;

  MovieRepository(this._apiService);

  Future<List<Movie>> getTrendingMovie() => _apiService.getTrendingMovies();

  Future<List<Movie>> getRecentMovies() => _apiService.getRecentMovies();
}
