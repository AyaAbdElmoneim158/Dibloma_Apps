import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/views/profile_views/widgets/shipping_address_card.dart';

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
