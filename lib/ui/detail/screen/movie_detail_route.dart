import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/ui/detail/screen/movie_detail_screen.dart';
import 'package:driver_license_test/ui/detail/viewmodel/movie_detail_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MovieDetailRoute {
  static Widget route(Movie movie) => Provider<MovieDetailViewModel>(
        create: (context) => MovieDetailViewModel(),
        builder: (context, child) => MovieDetailScreen(movie: movie),
      );
}
