import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class AppConfig {
  final String baseUrl;
  final Dio httpClient;

  AppConfig({required this.baseUrl, required this.httpClient});

  static Future<AppConfig> forEnvironment({String env = 'dev'}) async {
    try {
      final filePath = 'assets/config/$env.json';
      final contents = await rootBundle.loadString(filePath);
      final json = jsonDecode(contents);

      final _baseUrl = json['BASE_URL'];
      final dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
      ));

      return AppConfig(baseUrl: _baseUrl, httpClient: dio);
    } catch (e) {
      rethrow;
    }
  }
}
