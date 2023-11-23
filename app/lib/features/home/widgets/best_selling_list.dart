import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/shareable_components/common_product_v_card.dart';
import 'package:todo_app/core/utils/helper.dart';

class BestSellingList extends StatelessWidget {
  const BestSellingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Helper.wSizeBox(8),
        itemCount: products.length,
        itemBuilder: (context, index) => CommonProductVCard(
          product: products[index],
        ),
      ),
    );
  }
}
