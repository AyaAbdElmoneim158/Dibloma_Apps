import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/core/error/server_failure.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/core/utils/end_points.dart';
import 'package:todo_app/src/model/category_model.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/services/product_services/i_product_services.dart';

class ProductService implements IProductService {
  final DioHelper dioHelper;

  ProductService(this.dioHelper);

  @override
  Future<Either<IFailure, CategoryModel>> createProduct({
    required String title,
    required int price,
    required String description,
    required int categoryId,
    List<String>? images,
  }) async {
    try {
      final response = await dioHelper.post(
        EndPoints.createProductEndPoint(),
        data: {
          "title": title,
          "price": price,
          "description": description,
          "categoryId": categoryId,
          "images": images ?? [],
        },
      );
      var loadedList = CategoryModel.fromJson(response.data);
      return right(loadedList);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, bool>> deleteProduct(int id) async {
    try {
      final response =
          await dioHelper.delete(EndPoints.deleteProductEndPoint(id: id));
      return right(response.data);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ProductModel>>> filterProductByTitle(
      {required String title}) async {
    try {
      final response = await dioHelper.get(
        EndPoints.filterProductsByTitleEndPoint(
          title: title,
        ),
        queryParameters: {"title": title},
      );
      List<dynamic> data = response.data;
      List<ProductModel> loadedData =
          data.map((json) => ProductModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await dioHelper.get(EndPoints.getAllProductEndPoint());
      List<dynamic> data = response.data;
      List<ProductModel> loadedData =
          data.map((json) => ProductModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, CategoryModel>> updateProduct({
    String? title,
    int? price,
    List<String>? images,
    required int id,
  }) async {
    try {
      final response = await dioHelper.put(
        EndPoints.updateProductEndPoint(id: id),
        data: {
          if (title == null) 'title': title,
          if (price == null) 'price': price,
          if (images == null) 'images': images,
        },
      );
      final loadedData = CategoryModel.fromJson(response.data);
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ProductModel>>> filterProductByCategory(
      {required int categoryId, required String title}) async {
    try {
      final response = await dioHelper.get(
        EndPoints.filterProductsByCategoryEndPoint(
            title: title, category: categoryId),
        queryParameters: {"title": title},
      );
      List<dynamic> data = response.data;
      List<ProductModel> loadedData =
          data.map((json) => ProductModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ProductModel>>> filterProductByPriceRange(
      {required int priceMin, required int priceMax}) async {
    try {
      final response = await dioHelper.get(
        EndPoints.filterProductsByPriceRangeEndPoint(
            priceMax: priceMax, priceMin: priceMin),
        queryParameters: {
          'price_min': priceMin,
          'price_max': priceMax,
        },
      );
      List<dynamic> data = response.data;
      List<ProductModel> loadedData =
          data.map((json) => ProductModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }
}
