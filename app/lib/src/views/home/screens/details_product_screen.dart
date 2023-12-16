import 'package:flutter/material.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/views/home/widgets/image_list.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    debugPrint("productTitle: ${product.title}");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.network(
              product.images![0],
            ),
          ),
          Helper.hSizeBox(12),
          Padding(
            padding: const EdgeInsets.all(AppConst.globalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Helper.showProductPrice(
                        productPrice: '${product.price ?? 0}\$',
                        context: context),
                    Helper.showProductDescription(
                      context: context,
                      productDescription: product.category!.name!,
                    ),
                  ],
                ),
                Helper.hSizeBox(12),
                Helper.showHeader(
                  header: (product.title) ?? 'no title',
                ),
                Helper.hSizeBox(12),
                Helper.showHeaderDescription(
                    headerDescription: product.description ?? "no description"),
                Helper.hSizeBox(12),
                Helper.showProductDescription(
                    context: context, productDescription: 'Images'),
                SizedBox(
                    height: 50, child: ImagesList(images: product.images!)),
                Helper.hSizeBox(64),
                const CommonButton(
                  buttonText: "Add To Cart",
                  radius: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
