import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_shop/utils/constants/api_constants.dart';

class DioClient {
  static const _baseUrl = 'https://your-api.com';
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ),
  );

  static String? _refreshToken;

  static void setAuthToken(String token, {String? refreshToken}) {
    _refreshToken = refreshToken;
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearAuthToken() {
    _refreshToken = null;
    _dio.options.headers.remove('Authorization');
  }

  static void initialize() {
    _dio.interceptors.clear();
    _dio.interceptors.add(_tokenInterceptor());
    _dio.interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true),
    );
  }

  static InterceptorsWrapper _tokenInterceptor() {
    return InterceptorsWrapper(
      onError: (e, handler) async {
        if (_shouldRefresh(e)) {
          try {
            final newToken = await _refreshAuthToken();
            if (newToken != null) {
              _dio.options.headers['Authorization'] = 'Bearer $newToken';
              final clonedRequest = await _retryRequest(e.requestOptions);
              return handler.resolve(clonedRequest);
            }
          } catch (err) {
            log('[Token Refresh Failed] $err');
          }
        }
        return handler.next(e);
      },
    );
  }

  static bool _shouldRefresh(DioException error) {
    return error.response?.statusCode == 401 && _refreshToken != null;
  }

  static Future<String?> _refreshAuthToken() async {
    final response = await Dio().post(
      '$_baseUrl/auth/refresh',
      data: {'refreshToken': _refreshToken},
    );

    if (response.statusCode == 200) {
      final newToken = response.data['accessToken'];
      setAuthToken(newToken);
      return newToken;
    }
    return null;
  }

  static Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  static Future<ApiResponse> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return ApiResponse.success(response.data, response.statusCode);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<ApiResponse> post(
    String endpoint, {
    dynamic data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        onSendProgress: onSendProgress,
      );
      return ApiResponse.success(response.data, response.statusCode);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<ApiResponse> uploadFile(
    String endpoint,
    String filePath, {
    String fieldName = 'file',
    ProgressCallback? onProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        onSendProgress: onProgress,
      );

      return ApiResponse.success(response.data, response.statusCode);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<void> downloadFile(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
  }) async {
    await _dio.download(url, savePath, onReceiveProgress: onReceiveProgress);
  }

  static ApiResponse _handleError(dynamic error) {
    if (error is DioException) {
      final message =
          error.response?.data['message'] ?? error.message ?? 'Unknown error';
      return ApiResponse.error(message.toString(), error.response?.statusCode);
    }
    return ApiResponse.error('Unexpected error', null);
  }
}
