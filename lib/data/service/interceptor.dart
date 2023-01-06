import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print("METHOD: ${options.method.toUpperCase()}");
    print("URL: ${options.baseUrl + options.path}}");

    if (options.data != null) {
      print("BODY: ${options.data}");
    }
    print("------API request END-------");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print("STATUS CODE: ${response.statusCode}");
    if (response.data != null) {
      print("BODY: ${response.data}");
    }
    print("--------API response END--------");
  }
}
