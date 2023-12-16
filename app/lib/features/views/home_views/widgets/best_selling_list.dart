import 'package:flutter/cupertino.dart';
import '/features/model/product_model.dart';
import '/core/shareable_components/common_product_v_card.dart';
import '/core/utils/helper.dart';
import '/core/utils/consts.dart';

class BestSellingList extends StatelessWidget {
  const BestSellingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConst.homeListViewHeight * 1.6,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            Helper.wSizeBox(AppConst.globalSizeBox),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) => CommonProductVCard(
          product: dummyProducts[index],
        ),
      ),
    );
  }
}