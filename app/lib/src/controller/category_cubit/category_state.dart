part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

//* GetCategories-States * * * * * * * * * * * * * * * *
class GetCategoriesLoadingState extends CategoryState {}

class GetCategoriesSuccessState extends CategoryState {}

class GetCategoriesErrorState extends CategoryState {
  final String error;
  const GetCategoriesErrorState({required this.error});
}

//* CreateAllCategory-States * * * * * * * * * * * * * * * *
class CreateCategoryLoadingState extends CategoryState {}

class CreateCategorySuccessState extends CategoryState {}

class CreateCategoryErrorState extends CategoryState {
  final String error;
  const CreateCategoryErrorState({required this.error});
}

//* UpdateCategory-States * * * * * * * * * * * * * * * *
class UpdateCategoryLoadingState extends CategoryState {}

class UpdateCategorySuccessState extends CategoryState {}

class UpdateCategoryErrorState extends CategoryState {
  final String error;
  const UpdateCategoryErrorState({required this.error});
}

//* DeleteCategory-States * * * * * * * * * * * * * * * *
class DeleteCategoryLoadingState extends CategoryState {}

class DeleteCategorySuccessState extends CategoryState {}

class DeleteCategoryErrorState extends CategoryState {
  final String error;
  const DeleteCategoryErrorState({required this.error});
}

//* GetAllProductsByCategory-States * * * * * * * * * * * * * * * *
class GetProductsByCategoryLoadingState extends CategoryState {}

class GetProductsByCategorySuccessState extends CategoryState {}

class GetProductsByCategoryErrorState extends CategoryState {
  final String error;
  const GetProductsByCategoryErrorState({required this.error});
}
