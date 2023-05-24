import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:driver_license_test/config/environment.dart';

import '../../constant/Constant.dart';
import 'interceptor.dart';

@module
abstract class HttpClient {
  @lazySingleton
  @Named("baseUrl")
  String baseUrlProvider() {
    return Environment.instance.config?.baseUrl ?? "";
  }

  @lazySingleton
  @Named("baseImageUrl")
  String baseImageUrlProvider() {
    return Environment.instance.config?.baseImageUrl ?? "";
  }

  @lazySingleton
  Dio dioProvider() {
    return Dio()
      ..interceptors.add(DioCacheManager(CacheConfig(
              defaultMaxAge: const Duration(days: 7), maxMemoryCacheCount: 3))
          .interceptor)
      ..interceptors.add(LoggingInterceptor())
      ..options.headers["Authorization"] =
          "Bearer ${dotenv.env["API_READ_ACCESS_TOKEN"]}"
      ..options.baseUrl = baseUrlProvider()
      ..options.connectTimeout = AppConstant.TIME_OUT
      ..options.responseType = ResponseType.json;
  }
}
