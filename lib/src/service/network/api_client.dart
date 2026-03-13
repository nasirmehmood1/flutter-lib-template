import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../models/api_model.dart';
import '../../utils/constants.dart';

/// Centralized HTTP client for all API requests.
///
/// Handles GET, POST, PUT, and DELETE operations with
/// standardized error handling and response parsing.
class ApiClient {
  /// Variables
  final http.Client _client = http.Client();
  final Duration _timeout = const Duration(
    seconds: AppConstants.defaultTimeout,
  );

  /// Headers
  Map<String, String> _defaultHeaders({String? token}) {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // ---------------------------------------------------------------------------
  // [ApiClient] methods
  // ---------------------------------------------------------------------------

  /// Performs a safe wrapper around HTTP requests with unified error handling.
  Future<ApiModel> _safeRequest(Future<http.Response> Function() request) async {
    try {
      final http.Response response = await request().timeout(_timeout);
      return _handleResponse(response);
    } on SocketException {
      return const ApiModel(
        success: false,
        message: 'No internet connection',
      );
    } on TimeoutException {
      return const ApiModel(
        success: false,
        message: 'Request timed out',
      );
    } catch (e) {
      return ApiModel(
        success: false,
        message: e.toString(),
      );
    }
  }

  /// Performs a GET request to the given [uri].
  Future<ApiModel> getRequest({
    required Uri uri,
    String? token,
  }) {
    return _safeRequest(() => _client.get(
          uri,
          headers: _defaultHeaders(token: token),
        ));
  }

  /// Performs a POST request to the given [uri] with an optional [requestBody].
  Future<ApiModel> postRequest({
    required Uri uri,
    Map<String, dynamic>? requestBody,
    String? token,
  }) {
    return _safeRequest(() => _client.post(
          uri,
          headers: _defaultHeaders(token: token),
          body: requestBody != null ? jsonEncode(requestBody) : null,
        ));
  }

  /// Performs a PUT request to the given [uri] with an optional [requestBody].
  Future<ApiModel> putRequest({
    required Uri uri,
    Map<String, dynamic>? requestBody,
    String? token,
  }) {
    return _safeRequest(() => _client.put(
          uri,
          headers: _defaultHeaders(token: token),
          body: requestBody != null ? jsonEncode(requestBody) : null,
        ));
  }

  /// Performs a DELETE request to the given [uri].
  Future<ApiModel> deleteRequest({
    required Uri uri,
    String? token,
  }) {
    return _safeRequest(() => _client.delete(
          uri,
          headers: _defaultHeaders(token: token),
        ));
  }

  /// Parses the HTTP [response] into an [ApiModel].
  ApiModel _handleResponse(http.Response response) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {
      body = response.body; // Fallback if response is not valid JSON
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ApiModel(
        success: true,
        message: 'Success',
        statusCode: response.statusCode,
        data: body,
      );
    }
    
    // Extract error message from API response if available
    final String errorMessage = (body is Map && body.containsKey('message')) 
        ? body['message'].toString() 
        : 'Something went wrong';

    return ApiModel(
      success: false,
      message: errorMessage,
      statusCode: response.statusCode,
      data: body,
    );
  }
}
