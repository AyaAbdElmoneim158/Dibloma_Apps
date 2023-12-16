import 'package:flutter/material.dart';
import 'package:todo_app/src/views/profile/widgets/shipping_address_card.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.shippingAddress),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          children: [
            Helper.buildBottomTextAppBar(
              bottomText: "your ${AppStrings.shippingAddress}",
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 3),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const ShippingAddressCard(),
                separatorBuilder: (context, index) => Helper.hSizeBox(18),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
