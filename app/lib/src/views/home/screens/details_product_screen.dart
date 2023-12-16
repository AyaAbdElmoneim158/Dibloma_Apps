import 'package:flutter/material.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/views/home/widgets/color_list.dart';
import 'package:todo_app/src/views/home/widgets/size_list.dart';
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
              product.images![0] ,
            ),
          ),
          Helper.hSizeBox(12),
          Padding(
            padding: const EdgeInsets.all(AppConst.globalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Helper.showProductPrice(
                    productPrice: (product.price ?? 0).toString(),
                    context: context),
                Helper.showHeader(
                  header: (product.title) ?? 'no title',
                  //  context: context,
                ),
                Helper.hSizeBox(12),
                Helper.showProductDescription(
                    context: context,
                    productDescription:
                        product.description ?? "no description"),
                Helper.showHeaderDescription(headerDescription: "lorem" * 30),
                Helper.hSizeBox(12),
                Helper.showProductDescription(
                    context: context, productDescription: 'Color'),
                const ColorsList(),
                Helper.hSizeBox(12),
                Helper.showProductDescription(
                    context: context, productDescription: 'Size'),
                const SizesList(),
                Helper.hSizeBox(12),
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
