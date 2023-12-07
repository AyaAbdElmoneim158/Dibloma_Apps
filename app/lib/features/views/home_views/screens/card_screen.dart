import 'package:flutter/material.dart';
import '/features/model/product_model.dart';
import '/core/shareable_components/common_product_h_card.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/home_views/widgets/checkout_total_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.yourCart),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          children: [
            Helper.buildBottomTextAppBar(
              bottomText: "${dummyProducts.length} ${AppStrings.products}",
            ),
            Helper.hSizeBox(AppConst.globalPadding),
            Expanded(
              flex: 9,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    Helper.hSizeBox(AppConst.globalSizeBox),
                itemCount: dummyProducts.length,
                itemBuilder: (context, index) => CommonProductHCard(
                  product: dummyProducts[index],
                  isCartCard: true,
                ),
              ),
            ),
            Helper.hSizeBox(AppConst.globalPadding),
            const CheckoutTotalCard(),
            Helper.hSizeBox(AppConst.globalPadding),
          ],
        ),
      ),
    );
  }
}
