import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '/features/model/product_model.dart';
import '/core/router/routes.dart';
import '/core/shareable_components/common_card.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class CommonProductHCard extends StatelessWidget {
  const CommonProductHCard({
    super.key,
    required this.product,
    this.isCartCard = false,
  });
  final ProductModel product;
  final bool isCartCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.detailsProductRoute,
          arguments: product.productId),
      child: CommonCard(
        padding: 0,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConst.globalRadius),
                  bottomLeft: Radius.circular(AppConst.globalRadius),
                ),
                child: FancyShimmerImage(
                  imageUrl: product.productImage,
                  width: 120,
                  height: 120,
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(AppConst.globalSizeBox * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Helper.showProductDescription(
                        context: context,
                        productDescription: product.productName,
                      ),
                      Helper.showProductPrice(
                        productPrice: product.productPrice,
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(AppConst.globalPadding),
                  child: Column(
                    mainAxisAlignment: isCartCard
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: isCartCard
                        ? [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.fontColor,
                              ),
                            ),
                            Helper.showProductDescription(
                              context: context,
                              productDescription: '1',
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.minimize,
                                color: AppColors.grayFontColor,
                              ),
                            ),
                          ]
                        : [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_shopping_cart,
                                color: AppColors.primaryColor,
                              ),
                            )
                          ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
