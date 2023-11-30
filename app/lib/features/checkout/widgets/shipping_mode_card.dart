import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';

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
