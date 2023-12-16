import 'package:dio/dio.dart';

class StatusCode {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int internalServerError = 500;
}

String handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return 'check your connection';
    case DioExceptionType.sendTimeout:
      return 'Send Timeout';
    case DioExceptionType.receiveTimeout:
      return 'unable to connect to the server';
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return "Bad response";
      } else {
        return 'Something went wrong';
      }
    case DioExceptionType.cancel:
      return 'Something went wrong';
    default:
      return 'Something went wrong';
  }
}
