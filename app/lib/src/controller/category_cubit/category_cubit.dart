import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/dio_helper.dart';
import 'package:todo_app/src/model/category_model.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/services/category_services/category_services.dart';
import 'package:todo_app/src/services/category_services/i_category_services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);
  ICategoryService service = CategoryService(DioHelper());
  List<CategoryModel> allCategory = [];
  late CategoryModel category;
  List<ProductModel> allProductByCategory = [];
  bool isDeleted = false;

  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    var res = await service.getCategories();
    res.fold(
      (left) {
        debugPrint('GetCategories: Failure with err  ${left.errMessage}');
        emit(GetCategoriesErrorState(error: left.errMessage));
      },
      (right) {
        allCategory = right;
        debugPrint(
            'GetCategories: Successfully with len  ${allCategory.length}');
        emit(GetCategoriesSuccessState());
      },
    );
  }

  Future<void> getProductsByCategory(int id) async {
    emit(GetProductsByCategoryLoadingState());
    var res = await service.getProductsByCategory(id);
    res.fold(
      (left) {
        debugPrint(
            'getProductsByCategory: Failure with err  ${left.errMessage}');
        emit(GetProductsByCategoryErrorState(error: left.errMessage));
      },
      (right) {
        allProductByCategory = right;
        debugPrint(
            'getProductsByCategory: Successfully with len  ${allProductByCategory.length} ${allProductByCategory[0].title},');
        emit(GetProductsByCategorySuccessState());
      },
    );
  }

  Future<void> deleteCategory({
    required int id,
  }) async {
    emit(DeleteCategoryLoadingState());
    var res = await service.deleteCategory(id);
    res.fold(
      (left) {
        debugPrint(
            'deleteCategory: Failure Deleted category ${left.errMessage}');
        emit(DeleteCategoryErrorState(error: left.errMessage));
      },
      (right) {
        isDeleted = right;
        debugPrint(
            'deleteCategory: Successfully Deleted category $isDeleted....$right ');
        emit(DeleteCategorySuccessState());
      },
    );
  }

  Future<void> updateCategory(
    int categoryId, {
    required String name,
    String? image,
  }) async {
    emit(UpdateCategoryLoadingState());
    var res =
        await service.updateCategory(categoryId, name: name, image: image);
    res.fold(
      (left) {
        debugPrint(
            'updateCategory: Failure Updated category ${left.errMessage}');
        emit(UpdateCategoryErrorState(error: left.errMessage));
      },
      (right) {
        emit(UpdateCategorySuccessState());
        debugPrint('updateCategory: Successfully Updated category ');
      },
    );
  }

  Future<void> createCategory(String categoryName, String categoryImage) async {
    emit(CreateCategoryLoadingState());
    var res = await service.createCategory(categoryName, categoryImage);
    res.fold(
      (left) {
        debugPrint(
            'createCategory: Failure Updated category ${left.errMessage}');
        emit(CreateCategoryErrorState(error: left.errMessage));
      },
      (right) {
        debugPrint('createCategory: Successfully Updated category ');
        emit(CreateCategorySuccessState());
      },
    );
  }
}
