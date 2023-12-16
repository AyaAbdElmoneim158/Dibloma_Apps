import 'package:todo_app/core/utils/asset_manager.dart';

class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({
    id,
    name,
    image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  static List<CategoryModel> dummyCategories = [
    CategoryModel(
      id: 1,
      image: ImageAssets.category1Image,
      name: 'clothes',
    ),
    CategoryModel(
      id: 2,
      image: ImageAssets.category2Image,
      name: 'electronics',
    ),
    CategoryModel(
      id: 3,
      image: ImageAssets.category3Image,
      name: 'furniture',
    ),
    CategoryModel(
      id: 4,
      image: ImageAssets.category4Image,
      name: 'shoes',
    ),
  ];
}
