import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:injectable/injectable.dart' hide Environment;
import 'package:driver_license_test/config/environment.dart';

import '../../constant/Constant.dart';
import 'interceptor.dart';

@lazySingleton
class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio()
      ..interceptors.add(DioCacheManager(CacheConfig(
              defaultMaxAge: const Duration(days: 7), maxMemoryCacheCount: 3))
          .interceptor)
      ..interceptors.add(LoggingInterceptor())
      ..options.baseUrl = Environment.instance.config?.baseUrl ?? ""
      ..options.connectTimeout = HttpConstant.TIME_OUT
      ..options.responseType = ResponseType.json;
  }
}
