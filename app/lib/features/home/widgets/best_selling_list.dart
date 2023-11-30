import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/shareable_components/common_product_v_card.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/consts.dart';

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
