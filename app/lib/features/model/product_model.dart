// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:uuid/uuid.dart';

class ProductModel {
  final String productId;
  final String productImage;
  final String productName;
  final String productPrice;
  ProductModel({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });
}

List<ProductModel> dummyProducts = [
  ProductModel(
    productId: Uuid.NAMESPACE_DNS,
    productImage: ImageAssets.product2Image,
    productName: 'Camera',
    productPrice: r'$200.75',
  ),
  ProductModel(
    productId: Uuid.NAMESPACE_NIL,
    productImage: ImageAssets.product3Image,
    productName: 'Earphones',
    productPrice: r'$2425.75',
  ),
  ProductModel(
    productId: Uuid.NAMESPACE_OID,
    productImage: ImageAssets.product4Image,
    productName: 'Keyboard',
    productPrice: r'$100',
  ),
  ProductModel(
    productId: Uuid.NAMESPACE_URL,
    productImage: ImageAssets.product1Image,
    productName: 'Laptop',
    productPrice: r'$1200.75',
  ),
  ProductModel(
    productId: Uuid.NAMESPACE_X500,
    productImage: ImageAssets.product5Image,
    productName: 'Screen',
    productPrice: r'$1000',
  ),
  ProductModel(
    productId: '1',
    productImage: ImageAssets.product6Image,
    productName: 'Smartphone',
    productPrice: r'$2000',
  ),
  ProductModel(
    productId: '2',
    productImage: ImageAssets.product7Image,
    productName: 'Tablet',
    productPrice: r'$1500',
  ),
];
