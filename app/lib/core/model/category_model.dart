import 'package:todo_app/core/utils/asset_manager.dart';

class CategoryModel {
  String name;
  String image;
  CategoryModel({
    required this.name,
    required this.image,
  });
}

List<CategoryModel> categories = [
  CategoryModel(
    name: 'Computers',
    image: ImageAssets.product1Image,
  ),
  CategoryModel(
    name: 'Phones & Accessories',
    image: ImageAssets.product6Image,
  ),
  CategoryModel(
    name: 'lights & Light',
    image: ImageAssets.product3Image,
  ),
  CategoryModel(
    name: 'Office Equipments',
    image: ImageAssets.product4Image,
  ),
];
