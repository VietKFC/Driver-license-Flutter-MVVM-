import 'dart:async';

import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/repository/movie_repository.dart';

import '../../../di/dependency_injection.dart';

class HomeViewModel {
  final _movieRepository = getIt.get<MovieRepository>();
  final baseImageUrl = getIt.get<String>(instanceName: "baseImageUrl");

  StreamController upcomingMovieStreamController =
      StreamController<List<Movie>>.broadcast();
  StreamController topRatedMovieStreamController =
      StreamController<List<Movie>>.broadcast();
  StreamController isUpcomingMoviesLoading = StreamController<bool>.broadcast();
  StreamController isTopRatedMoviesLoading = StreamController<bool>.broadcast();

  void getUpcomingMovies() {
    isUpcomingMoviesLoading.sink.add(true);
    _movieRepository.getUpcomingMovies().then((response) {
      final List<Movie> movies = response.mapToListMovies();
      for (var element in movies) {
        element.posterPath = baseImageUrl + element.posterPath;
      }
      upcomingMovieStreamController.sink.add(movies);
      isUpcomingMoviesLoading.sink.add(false);
    });
  }

  void getTopRatedMovies() {
    isTopRatedMoviesLoading.sink.add(true);
    _movieRepository.getTopRateMovies().then((response) {
      final List<Movie> movies = response.mapToListMovies();
      for (var element in movies) {
        element.posterPath = baseImageUrl + element.posterPath;
      }
      topRatedMovieStreamController.sink.add(movies);
      isTopRatedMoviesLoading.sink.add(false);
    });
  }
}
