import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';

class CommonProductVCard extends StatelessWidget {
  const CommonProductVCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsProductRoute);
        debugPrint('CommonProductVCard');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: Styles.getBoxShadowStyle(),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
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
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CommonCircleAvatar(
                    radius: 16,
                    shape: BoxShape.rectangle,
                    avatar: Icon(
                      IconlyBroken.heart,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Helper.hSizeBox(12),
          Helper.showProductDescription(
              context: context, productDescription: product.productName),
          Helper.showProductPrice(
              productPrice: product.productPrice, context: context)
        ],
      ),
    );
  }
}
