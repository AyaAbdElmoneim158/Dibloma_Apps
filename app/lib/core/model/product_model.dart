// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/utils/asset_manager.dart';

class ProductModel {
  final String productImage;
  final String productName;
  final String productPrice;
  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });
}

List<ProductModel> products = [
  ProductModel(
    productImage: ImageAssets.product2Image,
    productName: 'Camera',
    productPrice: r'$200.75',
  ),
  ProductModel(
    productImage: ImageAssets.product3Image,
    productName: 'Earphones',
    productPrice: r'$2425.75',
  ),
  ProductModel(
    productImage: ImageAssets.product4Image,
    productName: 'Keyboard',
    productPrice: r'$100',
  ),
  ProductModel(
    productImage: ImageAssets.product1Image,
    productName: 'Laptop',
    productPrice: r'$1200.75',
  ),
  ProductModel(
    productImage: ImageAssets.product5Image,
    productName: 'Screen',
    productPrice: r'$1000',
  ),
  ProductModel(
    productImage: ImageAssets.product6Image,
    productName: 'Smartphone',
    productPrice: r'$2000',
  ),
  ProductModel(
    productImage: ImageAssets.product7Image,
    productName: 'Tablet',
    productPrice: r'$1500',
  ),
];
