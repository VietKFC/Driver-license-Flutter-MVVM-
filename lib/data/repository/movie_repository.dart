import 'package:driver_license_test/data/model/base_list_response.dart';
import 'package:driver_license_test/data/model/movie_watch_list_request.dart';
import 'package:injectable/injectable.dart';

import '../model/backdrop_response.dart';
import '../model/base_response_post.dart';
import '../model/movie.dart';
import '../service/api_service.dart';

@lazySingleton
class MovieRepository {
  final ApiService _apiService;

  MovieRepository(this._apiService);

  Future<BaseListResponse> getUpcomingMovies() =>
      _apiService.getUpcomingMovies();

  Future<BaseListResponse> getPopularMovies() => _apiService.getPopularMovies();

  Future<BaseListResponse> getTopRateMovies() => _apiService.getTopRateMovies();

  Future<BaseListResponse> getListTvShows() => _apiService.getListTvShows();

  Future<BaseResponsePost> addToWatchList(
          int accountId, MovieWatchListRequest request) =>
      _apiService.addToWatchList(accountId, request);

  Future<BaseListResponse> getWatchListMovies(int accountId) =>
      _apiService.getWatchListMovies(accountId);

  Future<BackdropResponse> getBackdropList(int movieId) =>
      _apiService.getBackdropList(movieId);

  Future<Movie> getMovieDetail(int movieId) =>
      _apiService.getMovieDetail(movieId);

  Future<BaseListResponse> getVideosByMovieId(int movieId) =>
      _apiService.getVideosByMovieId(movieId);
}
