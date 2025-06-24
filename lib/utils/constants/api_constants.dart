import 'package:e_shop/utils/constants/enums.dart';

class ApiResponse {
  final ApiStatus status;
  final dynamic data;
  final String? message;
  final int? statusCode;

  const ApiResponse({
    required this.status,
    this.data,
    this.message,
    this.statusCode,
  });

  factory ApiResponse.success(dynamic data, [int? statusCode]) => ApiResponse(
    status: ApiStatus.success,
    data: data,
    statusCode: statusCode,
  );

  factory ApiResponse.error(String message, [int? statusCode]) => ApiResponse(
    status: ApiStatus.error,
    message: message,
    statusCode: statusCode,
  );
}
