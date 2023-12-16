import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/src/model/category_model.dart';
import 'package:todo_app/src/model/product_model.dart';

//  Future<Either<IFailure, TokenModel>>
abstract class ICategoryService {
  Future<Either<IFailure,List<CategoryModel>>> getCategories();
  Future<Either<IFailure,List<ProductModel>>> getProductsByCategory(int id);
  Future<Either<IFailure,CategoryModel>> createCategory(
    String categoryName,
    String categoryImage,
  );
  Future<Either<IFailure,CategoryModel>> updateCategory(
    int categoryId, {
    required String name,
    String? image,
  });
  Future<Either<IFailure,bool>> deleteCategory(int categoryId);
}
