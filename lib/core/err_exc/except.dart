import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'exception.dart';
import '../ext/str_exception.dart';

Future<T> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return await apiCall();
  } on DioException catch (e, st) {
    log("# DioException: ERROR: $e | STACKTRACE: $st");
    if (e.type == DioExceptionType.connectionTimeout) {
      throw TimeoutException('Connection timed out. Please try again.');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw TimeoutException('Receive timeout. Please try again.');
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw TimeoutException('Send timeout. Please try again.');
    } else if (e.type == DioExceptionType.badResponse) {
      final responseBody = e.response?.data;
      if (responseBody != null) {
        responseBody.toPrintPrettyJson();
        final errorMessage = responseBody['message'] ?? 'An error occurred.';
        throw ServerException(errorMessage);
      } else {
        throw const ServerException('An error occurred.');
      }
    } else if (e.type == DioExceptionType.cancel) {
      throw CancellationException( message: 'Request was canceled.');
    } else {
      throw const ServerException('An error occurred.');
    }
  } catch (e, st) {
    log("UnknownException: $e | $st");
    throw UnknownException(message: 'An unknown error occurred. Please try again later. | ${e.toString()} | ${st.toString()} |');
  }
}