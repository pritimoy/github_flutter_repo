import 'package:dio/dio.dart';

class ApiProviderTokenInterceptor extends Interceptor {
  ApiProviderTokenInterceptor();

  int retry = 1;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra['isAuth'] == true) {
      // Here get the token from tokenCacheDataSource and set to token value
      String token = "jwt";

      if (token.isNotEmpty) {
        options.headers.addAll({
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        });
      } else {
        // logout the user
      }

      handler.next(options);
    } else {
      handler.next(options);
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response == null) {
      return handler.next(err);
    }
    if ((err.response!.statusCode == 401 || err.response!.statusCode == 403)) {
      final options = err.requestOptions;
      if (retry >= 0) {
        --retry;
        // refresh the api then call again
      } else {
        await cleanCache();
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<void> cleanCache() async {
    //call logout service then clear the cache
  }
}
