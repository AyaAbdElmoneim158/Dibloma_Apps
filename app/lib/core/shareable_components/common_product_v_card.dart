import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/router/routes.dart';
import '../../src/model/product_model.dart';
import '/core/shareable_components/common_circle_avatar.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/core/utils/styles.dart';

class CommonProductVCard extends StatelessWidget {
  const CommonProductVCard({super.key, required this.product, this.onTap});
  final ProductModel product;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.detailsProductRoute,
          arguments: product),
      child: SizedBox(
        width: 170,
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
                    child: Image.network(
                      product.images![0],
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
              productDescription: product.title ?? 'No title',
            ),
            Helper.showProductPrice(
              type: "V",
              productPrice: (product.price ?? 0).toString(),
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
