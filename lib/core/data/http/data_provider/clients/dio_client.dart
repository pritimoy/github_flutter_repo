import 'package:dio/dio.dart';
import 'package:github_flutter_repo/app/app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_provider_token_interceptor.dart';

class DioClient {
  static final _dioClient = DioClient._internal();
  DioClient._internal();
  Dio dio = Dio(
    BaseOptions(
      baseUrl: appConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10), // 10 s
      headers: <String, String>{
        'Content-Type': 'application/json',
        'content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
        'Accept-Language': 'ja',
      },
    ),
  );

  factory DioClient() {
    return _dioClient;
  }

  setClient() {
    dio
      ..interceptors.add(ApiProviderTokenInterceptor())
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ));
  }

  getClient() {
    return dio;
  }
}

final DioClient dioClient = DioClient();
