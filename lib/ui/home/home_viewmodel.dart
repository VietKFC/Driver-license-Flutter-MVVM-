import 'dart:async';

import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/repository/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/dependency_injection.dart';

class HomeViewModel {
  final _movieRepository = getIt.get<MovieRepository>();

  StreamController movieStreamController = StreamController<Movie>.broadcast();
  StreamController isShowLoading = StreamController<bool>.broadcast();

  void getTrendingMovies() {
    isShowLoading.sink.add(true);
    _movieRepository.getTrendingMovie().then((movies) {
      movieStreamController.sink.add(movies);
      isShowLoading.sink.add(false);
    });
  }
}
