import 'package:driver_license_test/data/model/base_list_response.dart';
import 'package:driver_license_test/data/model/base_response_post.dart';
import 'package:driver_license_test/data/model/movie_watch_list_request.dart';

import '../model/backdrop_response.dart';
import '../model/movie.dart';

abstract class ApiService {
  Future<BaseListResponse> getUpcomingMovies();

  Future<BaseListResponse> getPopularMovies();

  Future<BaseListResponse> getTopRateMovies();

  Future<BaseListResponse> getListTvShows();

  Future<BaseResponsePost> addToWatchList(
      int accountId, MovieWatchListRequest request);

  Future<BaseListResponse> getWatchListMovies(int accountId);

  Future<BackdropResponse> getBackdropList(int movieId);

  Future<Movie> getMovieDetail(int movieId);

  Future<BaseListResponse> getVideosByMovieId(int movieId);
}
