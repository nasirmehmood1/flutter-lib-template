import 'package:equatable/equatable.dart';

/// Generic API response model.
///
/// Used as a standardized return type for all [ApiClient] methods
/// so that callers always receive a consistent response shape.
class ApiModel {
  int? _status;
  String? _message;
  Map<String, dynamic>? _body;

  ApiModel({int? status, String? message, Map<String, dynamic>? body})
      : _status = status,
        _message = message,
        _body = body;

  int? get status => _status;

  String? get message => _message;

  Map<String, dynamic>? get body => _body;

  set setStatus(int? status) => _status = status;

  set setMessage(String? message) => _message = message;

  set setBody(Map<String, dynamic>? body) => _body = body;
}

