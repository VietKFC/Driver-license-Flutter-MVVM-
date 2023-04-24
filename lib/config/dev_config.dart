import 'package:driver_license_test/base/base_config.dart';

class DevConfig extends BaseConfig {
  @override
  String get appName => "Movie streaming Dev";

  @override
  String get baseUrl => "https://api.consumet.org/movies/flixhq/";
}
