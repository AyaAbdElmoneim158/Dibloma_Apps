import '/core/utils/asset_manager.dart';

class CategoryModel {
  String name;
  String image;
  CategoryModel({
    required this.name,
    required this.image,
  });
}

List<CategoryModel> dummyCategories = [
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
  /* CategoryModel(
    name: 'Book',
    image: 'assets/images/categories/book_img.png',
  ),
  CategoryModel(
    name: 'Cosmetics',
    image: 'assets/images/categories/cosmetics.png',
  ),
  CategoryModel(
    name: 'Electronics',
    image: 'assets/images/categories/electronics.png',
  ),
  CategoryModel(
    name: 'Fashion',
    image: 'assets/images/categories/fashion.png',
  ),
  CategoryModel(
    name: 'Mobiles',
    image: 'assets/images/categories/mobiles.png',
  ),
  CategoryModel(
    name: 'Pc',
    image: 'assets/images/categories/pc.png',
  ),
  CategoryModel(
    name: 'Shoes',
    image: 'assets/images/categories/shoes.png',
  ),
  CategoryModel(
    name: 'Watch',
    image: 'assets/images/categories/watch.png',
  ),*/
];
