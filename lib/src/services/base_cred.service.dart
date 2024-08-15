import 'package:dio/dio.dart';

import '../config.dart';

abstract class BaseCredService {
  final Dio _dio = Dio();
  bool _mainnet = false;

  BaseCredService(bool mainnet) {
    _dio.options.baseUrl = ConfigReader.getCredentialURL(mainnet);
    _dio.options.connectTimeout = 60 * 1000;
    _mainnet = mainnet;
  }

  Dio get dio {
    return _dio;
  }

  basePrefix() {
    return _mainnet ? "/pro" : "/test";
  }

  applyAuthToken(String token) {
    _dio.options.headers["authorization"] = "Bearer $token";
    _dio.options.headers["tokenInfo"] = token;
  }

  removeAuthToken() {
    _dio.options.headers["authorization"] = "";
    _dio.options.headers["tokenInfo"] = "";
  }

  T? getResponseObject<T>(
      Map<String, dynamic> data, T Function(Map<String, dynamic> json) func) {
    return func(data);
  }
}
