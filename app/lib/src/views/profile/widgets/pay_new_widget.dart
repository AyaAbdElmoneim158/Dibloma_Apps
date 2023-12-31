import 'package:flutter/material.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/helper.dart';

class PayNewWidget extends StatelessWidget {
  const PayNewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Helper.showTotalText(
                text: AppStrings.total,
              ),
              Helper.showTotalPriceText(
                text: "\$150.0",
              ),
            ],
          ),
        ),
        Helper.wSizeBox(18),
        Expanded(
          child: CommonButton(
            buttonText: "Pay Now",
            onTap: () {},
          ),
        )
      ],
    );
  }
}
