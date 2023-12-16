import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/src/model/category_model.dart';

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryModel? category;

  ProductModel({
    id,
    title,
    price,
    description,
    images,
    // creationAt,
    // updatedAt,
    category,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    // creationAt = json['creationAt'];
    // updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    // category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    // data['creationAt'] = creationAt;
    // data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    // data['category'] = category;

    return data;
  }

  static List<ProductModel> dummyProducts = [
    ProductModel(
      id: 1,
      title: "ROG Zephyrus G15  ROG Zephyrus G15  ROG Zephyrus G15",
      price: 1599,
      description:
          "About this item\nUltra Slim Gaming Laptop, 15.6” 144Hz FHD Display, GeForce GTX 1660 Ti Max-Q, AMD  7 4800HS, 16GB DDR4, 512GB PCIe NVMe SSD, Wi-Fi 6, RGB Keyboard, Windows 10 Home, GA502IU-ES76",
      category: CategoryModel.dummyCategories[1],
      images: [ImageAssets.product1Image],
    ),
    ProductModel(
      id: 2,
      title: "Apple introduces iPhone 14 and iPhone 14 Plus",
      price: 1199,
      description:
          "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      category: CategoryModel.dummyCategories[1],
      images: [ImageAssets.product2Image],
    ),
    ProductModel(
      id: 3,
      title: " ROG Zephyrus G15",
      price: 1599,
      description:
          "About this item\nUltra Slim Gaming Laptop, 15.6” 144Hz FHD Display, GeForce GTX 1660 Ti Max-Q, AMD  7 4800HS, 16GB DDR4, 512GB PCIe NVMe SSD, Wi-Fi 6, RGB Keyboard, Windows 10 Home, GA502IU-ES76",
      category: CategoryModel.dummyCategories[0],
      images: [ImageAssets.product3Image],
    ),
    ProductModel(
      id: 4,
      title: "Apple introduces iPhone 14 and iPhone 14 Plus",
      price: 1199,
      description:
          "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      category: CategoryModel.dummyCategories[2],
      images: [ImageAssets.product4Image],
    ),
    ProductModel(
      id: 5,
      title: " ROG Zephyrus G15",
      price: 1599,
      description:
          "About this item\nUltra Slim Gaming Laptop, 15.6” 144Hz FHD Display, GeForce GTX 1660 Ti Max-Q, AMD  7 4800HS, 16GB DDR4, 512GB PCIe NVMe SSD, Wi-Fi 6, RGB Keyboard, Windows 10 Home, GA502IU-ES76",
      category: CategoryModel.dummyCategories[1],
      images: [ImageAssets.product5Image],
    ),
    ProductModel(
      id: 6,
      title: "Apple introduces iPhone 14 and iPhone 14 Plus",
      price: 1199,
      description:
          "A new, larger 6.7-inch size joins the popular 6.1-inch design, featuring a new dual-camera system, Crash Detection, a smartphone industry-first safety service with Emergency SOS via satellite, and the best battery life on iPhone",
      category: CategoryModel.dummyCategories[1],
      images: [ImageAssets.product7Image],
    ),
    ProductModel(
      id: 7,
      title: "Apple iPhone 14 Pro (128GB) - Black",
      price: 1399,
      description:
          "6.1-inch Super Retina XDR display with ProMotion and always-on display. Dynamic Island, a new and magical way to interact with your iPhone. 48MP main camera for up to 4x higher resolution. Cinematic mode, now in 4K Dolby Vision up to 30 fps. Action mode, for stable and smooth videos when you're on the move. Accident detection, vital safety technology that calls for help for you. All-day battery life and up to 23 hours of video playback.",
      category: CategoryModel.dummyCategories[1],
      images: [ImageAssets.product6Image],
    ),
  ];
}
