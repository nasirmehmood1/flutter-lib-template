import 'package:equatable/equatable.dart';

/// Generic API response model.
///
/// Used as a standardized return type for all [ApiClient] methods
/// so that callers always receive a consistent response shape.
class ApiModel extends Equatable {
  /// Whether the API request was successful.
  final bool success;

  /// A human-readable message describing the result.
  final String message;

  /// The HTTP status code of the response.
  final int? statusCode;

  /// The response payload, if any.
  final dynamic data;

  /// Creates an [ApiModel] instance.
  const ApiModel({
    required this.success,
    required this.message,
    this.statusCode,
    this.data,
  });

  /// Creates an [ApiModel] from a JSON map.
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      statusCode: json['statusCode'] as int?,
      data: json['data'],
    );
  }

  /// Converts this [ApiModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'statusCode': statusCode,
      'data': data,
    };
  }

  @override
  List<Object?> get props => [success, message, statusCode, data];
}
