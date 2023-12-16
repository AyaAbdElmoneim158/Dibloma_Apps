import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/core/error/server_failure.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/core/utils/end_points.dart';
import 'package:todo_app/src/model/category_model.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/services/category_services/i_category_services.dart';

class CategoryService implements ICategoryService {
  final DioHelper dioHelper;
  CategoryService(this.dioHelper);

  @override
  Future<Either<IFailure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await dioHelper.get(EndPoints.getCategoriesEndPoint());
      final List<dynamic> data = response.data;
      var loadedData =
          data.map((json) => CategoryModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ProductModel>>> getProductsByCategory(
      int id) async {
    try {
      final response =
          await dioHelper.get(EndPoints.getProductsByCategoryEndPoint(id));
      final List<dynamic> data = response.data;
      var loadedData = data.map((json) => ProductModel.fromJson(json)).toList();
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, bool>> deleteCategory(int id) async {
    try {
      final response =
          await dioHelper.delete(EndPoints.deleteCategoryEndPoint(id));
      return right(response.data);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, CategoryModel>> createCategory(
    String categoryName,
    String categoryImage,
  ) async {
    try {
      final response = await dioHelper.post(
        EndPoints.createCategoryEndPoint(),
        data: {
          'name': categoryName,
          'image': categoryImage,
        },
      );
      var loadedData = CategoryModel.fromJson(response.data);
      return right(loadedData);
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<IFailure, CategoryModel>> updateCategory(
    int categoryId, {
    required String name,
    String? image,
  }) async {
    try {
      final response = await dioHelper.put(
        EndPoints.updateCategoryEndPoint(id: categoryId),
        data: {
          'name': name,
          if (image == null) 'image': image,
        },
      );
      var loadedData = response.data;
      return right(CategoryModel.fromJson(loadedData));
    } on DioException catch (err) {
      return left(ServerFailure.fromDioError(err));
    } catch (err) {
      return left(ServerFailure(err.toString()));
    }
  }
}
