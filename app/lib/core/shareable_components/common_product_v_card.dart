import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/features/model/product_model.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';

class CommonProductVCard extends StatelessWidget {
  const CommonProductVCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.detailsProductRoute,
          arguments: product.productId),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: Styles.getBoxShadowStyle(),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product.productImage,
                    width: 170,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CommonCircleAvatar(
                    onTap: () {},
                    radius: 16,
                    shape: BoxShape.rectangle,
                    avatar: const Icon(
                      IconlyBroken.heart,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Helper.hSizeBox(AppConst.globalSizeBox),
          Helper.showProductDescription(
            type: "V",
            context: context,
            productDescription: product.productName,
          ),
          Helper.showProductPrice(
            type: "V",
            productPrice: product.productPrice,
            context: context,
          )
        ],
      ),
    );
  }
}
