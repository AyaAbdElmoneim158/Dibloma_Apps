import 'package:dio/dio.dart';

class DioHelper {
  late Dio _dio;

  DioHelper() {
    _dio = Dio();
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await _dio.post(url, data: data, options: Options(headers: headers));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await _dio.put(url, data: data, options: Options(headers: headers));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> patch(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await _dio.patch(url, data: data, options: Options(headers: headers));
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(url,
          data: data, options: Options(headers: headers));
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
