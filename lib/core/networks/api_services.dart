import 'package:dio/dio.dart';

class DioClient {
  // Private constructor
  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Add interceptors
    _dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Example: Add a fake auth token automatically
          options.headers['Authorization'] = 'Bearer myToken123';
          print("➡️ Sending request to: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ Response status: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("❌ Dio Error: ${e.message}");
          return handler.next(e);
        },
      ),
    ]);
  }

  // Static singleton instance
  static final DioClient _instance = DioClient._internal();

  late Dio _dio;

  // Public getter
  static Dio get dio => _instance._dio;
}
