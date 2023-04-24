import 'package:driver_license_test/base/base_config.dart';

class ProductConfig extends BaseConfig {
  @override
  String get appName => "Movie streaming";

  @override
  String get baseUrl => "https://api.consumet.org/movies/flixhq";
}
