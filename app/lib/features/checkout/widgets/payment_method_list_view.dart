import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_payment_card.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/helper.dart';

class PaymentMethodListView extends StatelessWidget {
  const PaymentMethodListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Helper.wSizeBox(8),
        itemBuilder: (context, index) =>
            const PaymentCard(paymentImage: ImageAssets.googleIcon),
        itemCount: 10,
      ),
    );
  }
}
