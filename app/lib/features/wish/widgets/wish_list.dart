import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/shareable_components/common_product_h_card.dart';
import 'package:todo_app/core/utils/helper.dart';

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
          product: products[index],
        ),
        separatorBuilder: (context, index) => Helper.hSizeBox(12),
        itemCount: products.length,
      ),
    );
  }
}
