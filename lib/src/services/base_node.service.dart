import 'package:dio/dio.dart';

import '../config.dart';

abstract class BaseNodeService {
  final Dio _dio = Dio();

  BaseNodeService(bool mainnet) {
    _dio.options.baseUrl = ConfigReader.getBaseURL(mainnet);
    _dio.options.connectTimeout = 60 * 1000;
  }

  Dio get dio {
    return _dio;
  }

  applyAuthToken(String token) {
    _dio.options.headers["authorization"] = "Bearer $token";
  }

  removeAuthToken() {
    _dio.options.headers["authorization"] = "";
  }

  T? getResponseObject<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic> json) func) {
    return func(data);
  }
}
