import 'package:flutter/material.dart';
import '/core/shareable_components/common_payment_card.dart';
import '/core/utils/asset_manager.dart';
import '/core/utils/helper.dart';

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
