import 'package:dio/dio.dart';
import 'package:schoolmanagement/core/network/token_storage.dart';

class ApiClient {
  ApiClient._internal();
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:6063",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Dio get dio => _dio;

  /// 🔐 Initialize interceptors (attach token automatically)
  void initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = '$token';
          }
          return handler.next(options);
        },
        onError: (e, handler) {
          if (e.response?.statusCode == 401) {
            print('⚠️ Unauthorized - Token may be expired');
            // TODO: handle refresh token or redirect to login
          }
          return handler.next(e);
        },
      ),
    );
  }

  /// 🟩 POST Request
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🟦 GET Request
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🟨 PUT Request
  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// 🟥 DELETE Request
  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  /// ⚙️ Centralized Error Handler
  String _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "Connection Timeout!";
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return "Receive Timeout!";
    } else if (e.type == DioExceptionType.badResponse) {
      return "Server Error: ${e.response?.statusCode}";
    } else if (e.type == DioExceptionType.unknown) {
      return "No Internet Connection!";
    } else {
      return "Unexpected Error: ${e.message}";
    }
  }
}
