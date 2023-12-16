import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/i_failures.dart';
import 'package:todo_app/src/model/category_model.dart';
import 'package:todo_app/src/model/product_model.dart';
//  Future<Either<IFailure, TokenModel>>

abstract class IProductService {
  Future<Either<IFailure,List<ProductModel>>> getAllProducts();
  Future<Either<IFailure,CategoryModel>> createProduct({
    required String title,
    required int price,
    required String description,
    required int categoryId,
    List<String>? images,
  });
  Future<Either<IFailure,CategoryModel>> updateProduct({
    String? title,
    int? price,
    List<String>? images,
    required int id,
  });
  Future<Either<IFailure,bool>> deleteProduct(int id);
  Future<Either<IFailure,List<ProductModel>>> filterProductByTitle({
    required String title,
  });
  Future<Either<IFailure,List<ProductModel>>> filterProductByCategory({
    required int categoryId,
    required String title,
  });
  Future<Either<IFailure,List<ProductModel>>> filterProductByPriceRange(
      {required int priceMin, required int priceMax});
}
