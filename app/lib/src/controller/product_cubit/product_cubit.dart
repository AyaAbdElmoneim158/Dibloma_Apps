import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/services/product_services/i_product_services.dart';
import 'package:todo_app/src/services/product_services/product_services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);
  IProductService service = ProductService(DioHelper());
  List<ProductModel> allProducts = [];
  List<ProductModel> filterProducts = [];
  late ProductModel product;

  Future<void> getAllProduct() async {
    emit(GetAllProductLoadingState());
    var res = await service.getAllProducts();
    res.fold(
      (left) {
        emit(GetAllProductErrorState(error: left.errMessage));
        debugPrint('getAllProduct: Failure getAll Products ${left.errMessage}');
      },
      (right) {
        allProducts = right;
        debugPrint(
            'getAllProduct: Successfully getAll Products ${allProducts.length}, DT: ${allProducts.runtimeType}');
        emit(GetAllProductSuccessState());
      },
    );
  }

  Future<void> createProduct({
    required String title,
    required int price,
    required String description,
    required int categoryId,
    List<String>? images,
  }) async {
    emit(CreateProductLoadingState());
    var res = await service.createProduct(
      title: title,
      price: price,
      description: description,
      categoryId: categoryId,
      images: (images != null) ? images : [],
    );
    res.fold(
      (left) {
        debugPrint(
            'createCategory: Failure created Product ${left.errMessage} ');
        emit(CreateProductErrorState(error: left.errMessage));
      },
      (right) {
        debugPrint(
            'createCategory: Successfully created Product ${right.name}');
        emit(CreateProductSuccessState());
      },
    );
  }

  Future<void> updateProduct({
    String? title,
    int? price,
    List<String>? images,
    required int id,
  }) async {
    emit(UpdateProductLoadingState());
    var res = await service.updateProduct(
        id: id, images: images, price: price, title: title);
    res.fold(
      (left) {
        emit(UpdateProductErrorState(error: left.errMessage));
        debugPrint('updateProduct: Failure Updated Product ${left.errMessage}');
      },
      (right) {
        emit(UpdateProductSuccessState());
        debugPrint(
            'updateProduct: Successfully Updated Product, ${right.name} ');
      },
    );
  }

  Future<void> deleteProduct(int id) async {
    emit(DeleteProductLoadingState());
    var res = await service.deleteProduct(id);
    res.fold(
      (left) {
        debugPrint('deleteProduct: Failure Deleted Product ${left.errMessage}');
        emit(DeleteProductErrorState(error: left.errMessage));
      },
      (right) {
        debugPrint('deleteProduct: Successfully Deleted Product $right ');
        emit(DeleteProductSuccessState());
      },
    );
  }

  Future<void> filterProductByTitle({
    required String title,
  }) async {
    emit(FilterProductsLoadingState());
    var res = await service.filterProductByTitle(title: title);
    res.fold(
      (left) {
        debugPrint(
            'filterProduct: Failure filterProduct Products ${left.errMessage}');
        emit(FilterProductsErrorState(error: left.errMessage));
      },
      (right) {
        filterProducts = right;

        debugPrint(
            'filterProduct: Successfully filterProduct Products ${filterProducts.length}, DT: ${filterProducts.runtimeType}');
        emit(FilterProductsSuccessState());
      },
    );
  }

  Future<void> filterProductByCategory({
    required int categoryId,
    required String title,
  }) async {
    emit(FilterProductByCategoryLoadingState());
    var res = await service.filterProductByCategory(
        categoryId: categoryId, title: title);
    res.fold(
      (left) {
        debugPrint(
            'filterProduct: Failure filterProduct Products ${left.errMessage}');
        emit(FilterProductByCategoryErrorState(error: left.errMessage));
      },
      (right) {
        filterProducts = right;

        debugPrint(
            'filterProduct: Successfully filterProduct Products ${filterProducts.length}, DT: ${filterProducts.runtimeType}');
        emit(FilterProductByCategorySuccessState());
      },
    );
  }

  Future<void> filterProductByPriceRange({
    required int priceMin,
    required int priceMax,
  }) async {
    emit(FilterProductByPriceRangeByCategoryLoadingState());
    var res = await service.filterProductByPriceRange(
        priceMax: priceMax, priceMin: priceMin);
    res.fold(
      (left) {
        debugPrint(
            'filterProduct: Failure filterProduct Products ${left.errMessage}');
        emit(FilterProductByPriceRangeByCategoryErrorState(
            error: left.errMessage));
      },
      (right) {
        filterProducts = right;

        debugPrint(
            'filterProduct: Successfully filterProduct Products ${filterProducts.length}, DT: ${filterProducts.runtimeType}');
        emit(FilterProductByPriceRangeByCategorySuccessState());
      },
    );
  }
}
