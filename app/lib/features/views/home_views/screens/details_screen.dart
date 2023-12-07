import 'package:flutter/material.dart';
import '/features/model/product_model.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/home_views/widgets/color_list.dart';
import '/features/views/home_views/widgets/size_list.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        dummyProducts.firstWhere((product) => product.productId == productId);
    debugPrint("product: ${product.productId} $productId ");
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
            padding: const EdgeInsets.all(AppConst.globalPadding),
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
