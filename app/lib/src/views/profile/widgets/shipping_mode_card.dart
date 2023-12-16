import 'package:flutter/material.dart';
import '/core/shareable_components/common_card.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/helper.dart';

class ShippingModeCard extends StatelessWidget {
  const ShippingModeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Helper.showCheckoutCardTextName(text: AppStrings.flatRate),
          Helper.showCheckoutCardTextName(text: "\$20"),
        ],
      ),
    );
  }
}
