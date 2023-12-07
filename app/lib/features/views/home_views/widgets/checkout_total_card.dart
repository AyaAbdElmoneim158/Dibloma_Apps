import 'package:flutter/material.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/helper.dart';

class CheckoutTotalCard extends StatelessWidget {
  const CheckoutTotalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Helper.showTotalText(
                    text: AppStrings.subTotal,
                  ),
                  Helper.showTotalPriceText(
                    text: "\$150.0",
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Helper.showTotalText(
                    text: AppStrings.total,
                  ),
                  Helper.showTotalPriceText(
                    text: "\$170.0",
                  ),
                ],
              ),
            ],
          ),
        ),
        Helper.wSizeBox(18),
        Expanded(
          child: CommonButton(
            onTap: () {},
            buttonText: AppStrings.checkout,
          ),
        )
      ],
    );
  }
}
