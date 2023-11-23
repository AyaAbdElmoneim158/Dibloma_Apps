import 'package:flutter/material.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/home/widgets/color_list.dart';
import 'package:todo_app/features/home/widgets/size_list.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(
              product.productImage,
            ),
          ),
          Helper.hSizeBox(12),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Helper.showProductPrice(
                    productPrice: product.productPrice, context: context),
                Helper.showHeader(header: product.productName),
                Helper.hSizeBox(12),
                Helper.showProductDescription(
                    context: context, productDescription: 'Description'),
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
