import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_shop/utils/constants/api_constants.dart';

class EHttpClient {
  static const String _baseUrl =
      'https://your-api-base-url.com'; // Replace with your API base URL

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Set authorization token
  static void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Clear authorization token
  static void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  /// GET request
  static Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// POST request
  static Future<Response> post(String endpoint, dynamic data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// PUT request
  static Future<Response> put(String endpoint, dynamic data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// DELETE request
  static Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Upload file
  static Future<Response> uploadFile(
    String endpoint,
    String filePath, {
    String fieldName = 'file',
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
      });
      final response = await _dio.post(endpoint, data: formData);
      return response;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Generic error handler
  static void _handleError(dynamic error) {
    if (error is DioException) {
      log('[Dio Error] ${error.message}');
      if (error.response != null) {
        log('Status Code: ${error.response?.statusCode}');
        log('Response Data: ${error.response?.data}');
      }
    } else {
      log('[Unknown Error] $error');
    }
  }

  /// Clear all headers
  static void clearHeaders() {
    _dio.options.headers.clear();
  }

  /// Generic GET with typed response
  static Future<ApiResponse> getTyped<T>(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      final data = fromJson(response.data as Map<String, dynamic>);
      return ApiResponse.success(data, response.statusCode);
    } catch (e) {
      return ApiResponse.error(_extractErrorMessage(e), _extractStatusCode(e));
    }
  }

  /// Generic POST with typed response
  static Future<ApiResponse> postTyped<T>(
    String endpoint, {
    required dynamic data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      final parsed = fromJson(response.data as Map<String, dynamic>);
      return ApiResponse.success(parsed, response.statusCode);
    } catch (e) {
      return ApiResponse.error(_extractErrorMessage(e), _extractStatusCode(e));
    }
  }

  static String _extractErrorMessage(dynamic error) {
    if (error is DioException) {
      return error.response?.data['message']?.toString() ??
          error.message ??
          'Unknown error';
    }
    return 'Unknown error';
  }

  static int? _extractStatusCode(dynamic error) {
    if (error is DioException) {
      return error.response?.statusCode;
    }
    return null;
  }

  static Future<ApiResponse> getList<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(endpoint);
      final List<dynamic> jsonList = response.data as List<dynamic>;
      final items = jsonList
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiResponse.success(items, response.statusCode);
    } catch (e) {
      return ApiResponse.error(_extractErrorMessage(e), _extractStatusCode(e));
    }
  }

  static Future<ApiResponse> getSingle<T>(
    String endpoint, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(endpoint);
      final data = fromJson(response.data as Map<String, dynamic>);
      return ApiResponse.success(data, response.statusCode);
    } catch (e) {
      return ApiResponse.error(_extractErrorMessage(e), _extractStatusCode(e));
    }
  }
}
