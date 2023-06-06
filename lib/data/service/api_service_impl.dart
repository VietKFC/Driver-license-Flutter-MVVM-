import 'package:dio/dio.dart';
import 'package:driver_license_test/data/model/base_response_post.dart';
import 'package:driver_license_test/data/model/movie_watch_list_request.dart';
import 'package:driver_license_test/data/service/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../model/backdrop_response.dart';
import '../model/base_list_response.dart';
import '../model/movie.dart';

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

  @override
  @GET('/discover/tv')
  Future<BaseListResponse> getListTvShows();

  @override
  @POST('/account/{account_id}/watchlist')
  Future<BaseResponsePost> addToWatchList(
      @Path("account_id") int accountId, @Body() MovieWatchListRequest request);

  @override
  @GET('/account/{account_id}/watchlist/movies')
  Future<BaseListResponse> getWatchListMovies(
      @Path("account_id") int accountId);

  @override
  @GET('/movie/{movie_id}/images')
  Future<BackdropResponse> getBackdropList(@Path("movie_id") int movieId);

  @override
  @GET('/movie/{movie_id}')
  Future<Movie> getMovieDetail(@Path("movie_id") int movieId);

  @override
  @GET('/movie/{movie_id}/videos')
  Future<BaseListResponse> getVideosByMovieId(@Path("movie_id") int movieId);
}
