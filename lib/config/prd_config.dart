import 'package:driver_license_test/base/base_config.dart';

class ProductConfig extends BaseConfig {
  @override
  String get appName => "Movie streaming";

  @override
  String get baseUrl => "https://api.themoviedb.org/3";

  @override
  String get baseImageUrl => "https://image.tmdb.org/t/p/original";
}
