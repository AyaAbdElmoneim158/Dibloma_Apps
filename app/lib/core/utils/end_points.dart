import 'package:dio/dio.dart';

class EndPoints {
  static String baseUrl = 'https://api.escuelajs.co/api/v1';
  static BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    // connectTimeout: const Duration(seconds: 5),
    // receiveTimeout: const Duration(seconds: 5),
    // headers: {}, // 'content-type': 'application',
    // contentType: 'application/json; charset=utf-8',
    // responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
  );

  // Category-Endpoints ========================================================
  static String getCategoriesEndPoint() => '$baseUrl/categories/';
  static String getProductsByCategoryEndPoint(int id) =>
      '$baseUrl/categories/$id/products';
  static String deleteCategoryEndPoint(int id) => '$baseUrl/categories/$id';
  static String getOneCategoryEndPoint({required int id}) =>
      '$baseUrl/categories/$id';
  static String createCategoryEndPoint() => '$baseUrl/categories/';
  static String updateCategoryEndPoint({required int id}) =>
      '$baseUrl/categories/$id';

  // Product-Endpoints =========================================================
  static String getAllProductEndPoint() => '$baseUrl/products/';
  static String getOneProductEndPoint({required int id}) =>
      '$baseUrl/products/$id';
  static String createProductEndPoint() => '$baseUrl/products/';
  static String updateProductEndPoint({required int id}) =>
      '$baseUrl/products/$id';
  static String deleteProductEndPoint({required int id}) =>
      '$baseUrl/products/$id';
  static String paginationProductEndPoint({
    int offset = 0,
    int limit = 10,
  }) =>
      '$baseUrl/products/?offset=$offset&limit=$limit';

  static String filterProductsByTitleEndPoint({String? title}) =>
      '$baseUrl/products';
  static String filterProductsByCategoryEndPoint(
          {required int category, String? title}) =>
      '$baseUrl/products';
  static String filterProductsByPriceRangeEndPoint(
          {required int priceMin, required int priceMax}) =>
      '$baseUrl/products';

  // /title=$title';
  //offset=$offset&limit=$limit&price=$price&title=$title&price_min=$priceMin&price_max=$priceMax&categoryId=$categoryId';

  // User-Endpoints ============================================================
  static String getAllUserEndPoint() => '$baseUrl/users/';
  static String getOneUserEndPoint({required int id}) => '$baseUrl/users/$id';
  static String createUserEndPoint() => '$baseUrl/users/';
  static String updateUserEndPoint({required int id}) => '$baseUrl/users/$id';
  static String checkEmailUserEndPoint() => '$baseUrl/users/is-available';

  // Auth-Endpoints ============================================================
  static String loginUserEndPoint() => '$baseUrl/auth/login/';
  static String getProfileEndPoint() =>
      '$baseUrl/auth/profile'; //Authorization: {your access token}
  static String refreshTokenUserEndPoint() => '$baseUrl/auth/refresh-token/';
}
