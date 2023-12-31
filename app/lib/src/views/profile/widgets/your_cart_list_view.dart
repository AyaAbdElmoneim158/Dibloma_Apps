import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/model/product_model.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/core/utils/styles.dart';

class YourCartListView extends StatelessWidget {
  const YourCartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            Helper.wSizeBox(AppConst.globalSizeBox),
        itemBuilder: (context, index) => _buildCard(index,context),
        itemCount: ProductModel.dummyProducts .length,
      ),
    );
  }

  ClipRRect _buildCard(int index, context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConst.globalRadius),
      child: Container(
        decoration: BoxDecoration(boxShadow: Styles.getBoxShadowStyle()),
        child: FancyShimmerImage(
          imageUrl: ProductModel.dummyProducts[index].images![0],
          width: 120,
          height: 120,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}
