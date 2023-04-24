import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/model/show.dart';

abstract class ApiService {
  Future<List<Movie>> getTrendingMovies();

  Future<List<Movie>> getRecentMovies();

  Future<List<Show>> getRecentShows();
}
