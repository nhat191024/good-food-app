import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:dio_log/dio_log.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'package:goodfoodapp/core/utils/env_config.dart';
import 'package:goodfoodapp/core/services/localstorage_service.dart';

class ApiService {
  late Dio _dio;

  static final String baseUrl = EnvConfig.apiBaseUrl;

  ApiService() {
    if (baseUrl.isEmpty || baseUrl == '') {
      throw Exception('API_BASE_URL is not set in environment variables');
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    //Authorization interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = StorageService.readData(key: LocalStorageKeys.token);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    //Smart retry interceptor
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1), // wait 1 sec before the first retry
          Duration(seconds: 2), // wait 2 sec before the second retry
          Duration(seconds: 3), // wait 3 sec before the third retry
        ],
      ),
    );

    _dio.interceptors.add(DioLogInterceptor());
  }

  Dio get dio => _dio;
}
