import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: Icon(
              IconlyLight.location,
              color: AppColors.primaryColor,
            ),
          ),
          Helper.wSizeBox(18),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Helper.showUserName(userName: "John Doe, +961-12345678"),
                Helper.showProductDescription(
                  context: context,
                  productDescription:
                      "order 20290836273838 has been ${AppStrings.lorem}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
