import 'dart:async';

import 'package:driver_license_test/data/model/backdrop.dart';
import 'package:driver_license_test/data/repository/movie_repository.dart';

import '../../../data/model/movie.dart';
import '../../../data/model/video.dart';
import '../../../di/dependency_injection.dart';

class MovieDetailViewModel {
  final MovieRepository _movieRepository = getIt.get<MovieRepository>();
  final baseImageUrl = getIt.get<String>(instanceName: "baseImageUrl");

  StreamController<List<Backdrop>> backdropListController =
      StreamController<List<Backdrop>>.broadcast();

  StreamController<Movie> movieDetailController =
      StreamController<Movie>.broadcast();

  StreamController<List<Video>> videoListController =
      StreamController<List<Video>>.broadcast();

  void getBackdropList(int movieId) {
    _movieRepository.getBackdropList(movieId).then((response) {
      final List<Backdrop> backdrops = response.backdrops;
      for (var element in backdrops) {
        element.filePath = baseImageUrl + element.filePath;
      }
      backdropListController.sink.add(backdrops);
    });
  }

  void getMovieDetail(int movieId) {
    _movieRepository.getMovieDetail(movieId).then((response) {
      if (response.companies == null || response.companies?.isEmpty == true) {
        return;
      }
      final Movie movie = response;
      for (var element in movie.companies!) {
        if (element.path != null && element.path?.isNotEmpty == true) {
          element.path = baseImageUrl + element.path!;
        }
      }
      movieDetailController.sink.add(movie);
    });
  }

  void getVideosByMovieId(int movieId) {
    _movieRepository.getVideosByMovieId(movieId).then((response) {
      videoListController.sink.add(response.mapToListVideos());
    });
  }
}
