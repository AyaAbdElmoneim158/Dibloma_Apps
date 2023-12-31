import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/model/product_model.dart';
import '/core/shareable_components/common_product_h_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class WishList extends StatelessWidget {
  const WishList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CommonProductHCard(
          product: ProductModel.dummyProducts[index],
        ),
        separatorBuilder: (context, index) => Helper.hSizeBox(
          AppConst.globalSizeBox + 4,
        ),
        itemCount: ProductModel.dummyProducts.length,
      ),
    );
  }
}
