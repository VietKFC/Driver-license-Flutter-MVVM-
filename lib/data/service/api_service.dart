import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:driver_license_test/constant/Constant.dart';
import 'package:driver_license_test/data/service/interceptor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  late Dio _dio;

  Future<Dio> get dio async {
    _dio = Dio()
      ..interceptors
          .add(DioCacheManager(CacheConfig(defaultMaxAge: const Duration(days: 7), maxMemoryCacheCount: 3)).interceptor)
      ..interceptors.add(LoggingInterceptor())
      ..options.connectTimeout = HttpConstant.TIME_OUT
      ..options.responseType = ResponseType.json;
    return _dio;
  }
}
