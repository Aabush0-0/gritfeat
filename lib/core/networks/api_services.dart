import 'package:dio/dio.dart';
import 'package:my_app/core/networks/api_urls.dart';

class ApiServices {
  ApiServices._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Urls.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.queryParameters['token'] = Urls.trefleToken;

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response status: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("Dio Error: ${e.message}");
          return handler.next(e);
        },
      ),
    ]);
  }

  static final ApiServices _instance = ApiServices._internal();

  late Dio _dio;

  // Public getter
  static Dio get dio => _instance._dio;
}
