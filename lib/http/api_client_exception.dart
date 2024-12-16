import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part '../.generated/http/api_client_exception.freezed.dart';

const genericErrorMessage = 'An error occurred. Please try again.';

enum ApiClientExceptionType {
  network,
  backend,
  unknown,
}

@freezed
class ApiClientException with _$ApiClientException implements Exception {
  factory ApiClientException({
    required ApiClientExceptionType type,
    required String message,
    int? statusCode,
    Map<String, String>? validationErrors,
  }) = _ApiClientException;

  factory ApiClientException.fromResponseBody(
    String responseBody,
    int? statusCode,
  ) {
    final Map<String, dynamic> json = jsonDecode(responseBody);

    statusCode = statusCode ?? 500;

    return ApiClientException(
      message: getMessageForBackendException(statusCode, json['message']),
      type: ApiClientExceptionType.backend,
      statusCode: statusCode,
      validationErrors: json['errors'] != null
          ? Map<String, dynamic>.from(json['errors']).map((key, value) =>
              MapEntry(key, value is List ? value.first : value))
          : null,
    );
  }

  factory ApiClientException.fromException(Exception e) {
    return switch (e) {
      SocketException _ => ApiClientException(
          message:
              'No internet connection. Please check your connection and try again.',
          type: ApiClientExceptionType.network,
        ),
      TimeoutException _ => ApiClientException(
          message: 'Request timed out. Please try again.',
          type: ApiClientExceptionType.network,
        ),
      _ => ApiClientException(
          message: genericErrorMessage,
          type: ApiClientExceptionType.unknown,
        ),
    };
  }

  static bool isBackendErrorResponse(dynamic responseBody) {
    if (responseBody is! String) {
      return false;
    }
    try {
      final Map<String, dynamic> json = jsonDecode(responseBody);
      return json['message'] != null;
    } catch (e) {
      return false;
    }
  }
}

String getMessageForBackendException(int statusCode, String? message) {
  return switch (statusCode) {
    401 => 'Your session has expired. Please sign in again.',
    _ => message ?? genericErrorMessage,
  };
}
