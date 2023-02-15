import 'package:dio/dio.dart';

import '../config.dart';

abstract class BaseRestService {
  final Dio _dio = Dio();
  final String _baseUrl = ConfigReader.getBaseURL();

  BaseRestService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 60 * 1000;
  }

  Dio get dio {
    return _dio;
  }

  T? getResponseObject<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic> json) func) {
    return func(data);
  }
}
