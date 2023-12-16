import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '/core/shareable_components/common_card.dart';
import '/core/utils/asset_manager.dart';
import '/core/utils/helper.dart';

class MyCardsScreen extends StatelessWidget {
  const MyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonCard(
            // color: AppColors.fontColor,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Helper.showProductDescription(
                    context: context,
                    productDescription: "Bank Name",
                  ),
                  Column(
                    children: [
                      Helper.showHeader(header: "12435678909"),
                      Helper.showProductDescription(
                        context: context,
                        productDescription: "1/23",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Helper.showProductDescription(
                        context: context,
                        productDescription: "Card Holder".toUpperCase(),
                      ),
                      FancyShimmerImage(
                        imageUrl: ImageAssets.googleIcon,
                        boxFit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
