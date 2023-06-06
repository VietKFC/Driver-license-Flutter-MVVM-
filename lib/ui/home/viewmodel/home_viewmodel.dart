import 'dart:async';

import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/model/tvshow.dart';
import 'package:driver_license_test/data/repository/movie_repository.dart';

import '../../../di/dependency_injection.dart';

class HomeViewModel {
  final _movieRepository = getIt.get<MovieRepository>();
  final baseImageUrl = getIt.get<String>(instanceName: "baseImageUrl");

  StreamController upcomingMovieStreamController =
      StreamController<List<Movie>>.broadcast();
  StreamController topRatedMovieStreamController =
      StreamController<List<Movie>>.broadcast();
  StreamController<List<TvShow>> tvShowsStreamController =
      StreamController<List<TvShow>>.broadcast();
  StreamController watchListMovieStreamController =
      StreamController<List<Movie>>.broadcast();

  void getUpcomingMovies() {
    _movieRepository.getUpcomingMovies().then((response) {
      final List<Movie> movies = response.mapToListMovies();
      for (var element in movies) {
        element.posterPath = baseImageUrl + element.posterPath;
        element.backdropPath = baseImageUrl + element.backdropPath;
      }
      upcomingMovieStreamController.sink.add(movies);
    });
  }

  void getTopRatedMovies() {
    _movieRepository.getTopRateMovies().then((response) {
      final List<Movie> movies = response.mapToListMovies();
      for (var element in movies) {
        element.posterPath = baseImageUrl + element.posterPath;
        element.backdropPath = baseImageUrl + element.backdropPath;
      }
      topRatedMovieStreamController.sink.add(movies);
    });
  }

  void getTvShows() {
    _movieRepository.getListTvShows().then((response) {
      final List<TvShow> tvShows = response.mapToListTvShows();
      for (var element in tvShows) {
        element.posterPath = baseImageUrl + element.posterPath;
      }
      tvShowsStreamController.sink.add(tvShows);
    });
  }

  void getWatchListMovies(int accountId) {
    _movieRepository.getWatchListMovies(accountId).then((response) {
      if (response.data.isEmpty) {
        return;
      }
      final List<Movie> movies = response.mapToListMovies();
      for (var element in movies) {
        element.posterPath = baseImageUrl + element.posterPath;
        element.backdropPath = baseImageUrl + element.backdropPath;
      }
      watchListMovieStreamController.sink.add(movies);
    });
  }
}
