part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

//* GetAllProduct-States * * * * * * * * * * * * * * * *
class GetAllProductLoadingState extends ProductState {}

class GetAllProductSuccessState extends ProductState {}

class GetAllProductErrorState extends ProductState {
  final String error;
  const GetAllProductErrorState({required this.error});
}

//* FilterProducts-States * * * * * * * * * * * * * * * *
class FilterProductsLoadingState extends ProductState {}

class FilterProductsSuccessState extends ProductState {}

class FilterProductsErrorState extends ProductState {
  final String error;
  const FilterProductsErrorState({required this.error});
}

//* FilterProductByCategory-States * * * * * * * * * * * * * * * *
class FilterProductByCategoryLoadingState extends ProductState {}

class FilterProductByCategorySuccessState extends ProductState {}

class FilterProductByCategoryErrorState extends ProductState {
  final String error;
  const FilterProductByCategoryErrorState({required this.error});
}

//* FilterProductByPriceRange-States * * * * * * * * * * * * * * * *
class FilterProductByPriceRangeByCategoryLoadingState extends ProductState {}

class FilterProductByPriceRangeByCategorySuccessState extends ProductState {}

class FilterProductByPriceRangeByCategoryErrorState extends ProductState {
  final String error;
  const FilterProductByPriceRangeByCategoryErrorState({required this.error});
}

//* CreateProduct-States * * * * * * * * * * * * * * * *
class CreateProductLoadingState extends ProductState {}

class CreateProductSuccessState extends ProductState {}

class CreateProductErrorState extends ProductState {
  final String error;
  const CreateProductErrorState({required this.error});
}

//* GetOneProduct-States * * * * * * * * * * * * * * * *
class GetOneProductLoadingState extends ProductState {}

class GetOneProductSuccessState extends ProductState {}

class GetOneProductErrorState extends ProductState {
  final String error;
  const GetOneProductErrorState({required this.error});
}

//* UpdateProduct-States * * * * * * * * * * * * * * * *
class UpdateProductLoadingState extends ProductState {}

class UpdateProductSuccessState extends ProductState {}

class UpdateProductErrorState extends ProductState {
  final String error;
  const UpdateProductErrorState({required this.error});
}

//* DeleteProduct-States * * * * * * * * * * * * * * * *
class DeleteProductLoadingState extends ProductState {}

class DeleteProductSuccessState extends ProductState {}

class DeleteProductErrorState extends ProductState {
  final String error;
  const DeleteProductErrorState({required this.error});
}
