import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart' as client;

import '../../models/api_model.dart';
import '../../utils/constants.dart';

/// Centralized HTTP client for all API requests.
///
/// Handles GET, POST, PUT, and DELETE operations with
/// standardized error handling and response parsing.

class ApiClient {
  Future<ApiModel> getRequest(
      {required Uri uri, Map<String, String>? apiHeader}) async {
    try {
      final response = await client.get(
        uri,
        headers: apiHeader ?? generalApiHeader,
      );
      return _handleResponse(response);
    } on SocketException catch (e) {
      return defaultSocketErrorMap(e.message);
    } catch (e) {
      return defaultServerErrorMap;
    }
  }

  Future<ApiModel> deleteRequest(
      {required Uri uri, Map<String, String>? apiHeader}) async {
    try {
      final response = await client.delete(
        uri,
        headers: apiHeader ?? generalApiHeader,
      );
      return _handleResponse(response);
    } on SocketException catch (e) {
      return defaultSocketErrorMap(e.message);
    } catch (e) {
      return defaultServerErrorMap;
    }
  }

  Future<ApiModel> postRequest(
      {required Uri uri,
        required Map<String, dynamic> requestBody,
        Map<String, String>? apiHeader}) async {
    try {
      final response = await client.post(
        uri,
        headers: apiHeader ?? generalApiHeader,
        body: requestBody,
      );
      return _handleResponse(response);
    } on SocketException catch (e) {
      return defaultSocketErrorMap(e.message);
    } catch (e) {
      return defaultServerErrorMap;
    }
  }

  Future<ApiModel> putRequest(
      {required Uri uri,
        required Map<String, dynamic> requestBody,
        Map<String, String>? apiHeader}) async {
    try {
      final response = await client.put(
        uri,
        headers: apiHeader ?? generalApiHeader,
        body: requestBody,
      );
      return _handleResponse(response);
    } on SocketException catch (e) {
      return defaultSocketErrorMap(e.message);
    } catch (e) {
      return defaultServerErrorMap;
    }
  }

  Future<ApiModel> postMultiPartRequest({
    required Uri uri,
    required Map<String, dynamic> requestBody,
    Map<String, String>? apiHeader,
    required File file,
  }) async {
    try {
      var request = client.MultipartRequest("POST", uri);

      // Add all headers
      request.headers.addAll(apiHeader ?? generalApiHeader);

      // Add regular fields
      requestBody.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      // Add file
      // request.files.add(await client.MultipartFile.fromPath(
      //   'files',
      //   file.path,
      //   contentType: getMediaType(fileUrl: file.path),
      // ));

      final streamedResponse = await request.send();
      var response = await client.Response.fromStream(streamedResponse);
      return _handleResponse(response);
    } on SocketException catch (e) {
      return defaultSocketErrorMap(e.message);
    } catch (e) {
      return defaultServerErrorMap;
    }
  }

  _handleResponse(http.Response response) {
    try {
      Map<String, dynamic> responseBody = {};
      if (response.body.isNotEmpty) {
        responseBody = jsonDecode(response.body);
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiModel(status: 200, message: 'OK', body: responseBody);
      } else {
        return ApiModel(
          message: responseBody["message"] ??
              responseBody["result"] ??
              responseBody["error"] ??
              generalApiError,
        );
      }
    } catch (e) {
      return defaultServerErrorMap;
    }
  }
}


