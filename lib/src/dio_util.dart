import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioUtil {
  static Dio? _dio;
  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(),
      );

      // 配置代理
      // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      //     (client) {
      //   // config the http client
      //   client.findProxy = (uri) {
      //     //proxy all request to localhost:8888
      //     return "PROXY localhost:8888";
      //   };
      //   // you can also create a HttpClient to dio
      //   // return HttpClient();
      // };

      _dio!.interceptors.addAll([
        if (kDebugMode) LogInterceptor(responseBody: true, requestBody: true),
      ]);
    }
    return _dio!;
  }
}
