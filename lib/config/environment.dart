import 'package:driver_license_test/config/dev_config.dart';
import 'package:driver_license_test/config/prd_config.dart';

import '../base/base_config.dart';

class Environment {
  factory Environment() {
    return instance;
  }

  static final Environment instance = Environment._internal();

  Environment._internal();

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case DEV:
        return DevConfig();
      case PRODUCTION:
        return ProductConfig();
      default:
        return DevConfig();
    }
  }

  static const String DEV = "DEV";
  static const String PRODUCTION = "PROD";
}
