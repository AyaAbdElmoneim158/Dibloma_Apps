import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';

class PromotionsCard extends StatelessWidget {
  const PromotionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConst.globalRadius),
              child: FancyShimmerImage(
                imageUrl: ImageAssets.product1Image,
                boxFit: BoxFit.cover,
                height: 90,
                width: 120,
              ),
            ),
          ),
          Helper.wSizeBox(AppConst.globalSizeBox),
          Expanded(
            flex: 8,
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Helper.showPromotionsDecText(text: AppStrings.lorem),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Helper.showPromotionsTimeText(
                        text: AppStrings.time,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
