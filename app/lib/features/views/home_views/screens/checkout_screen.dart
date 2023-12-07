import 'package:flutter/material.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/core/utils/app_strings.dart';
import '../widgets/address_card.dart';
import '../widgets/pay_new_widget.dart';
import '../widgets/payment_method_list_view.dart';
import '../widgets/shipping_mode_card.dart';
import '../widgets/your_cart_list_view.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.checkout),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Helper.showHeaderList(
                header: AppStrings.yourAddress,
                leftText: AppStrings.changeAddress,
              ),
              const AddressCard(),
              Helper.hSizeBox(AppConst.globalSizeBox),
              Helper.showHeaderList(
                header: AppStrings.shippingMode,
                leftText: AppStrings.changeMode,
              ),
              const ShippingModeCard(),
              Helper.hSizeBox(AppConst.globalSizeBox),
              Helper.showHeaderList(
                header: AppStrings.yourCart,
                leftText: AppStrings.viewAll,
              ),
              const YourCartListView(),
              Helper.showHeaderList(
                header: AppStrings.paymentMethod,
                leftText: "",
              ),
              const PaymentMethodListView(),
              Helper.showHeaderList(
                header: AppStrings.orderSummary,
                leftText: "",
              ),
              Helper.showHeaderList(
                header: AppStrings.coupon,
                leftText: AppStrings.addCoupon,
                hasBorder: true,
                onPressed: () {},
              ),
              Helper.hSizeBox(AppConst.globalSizeBox),
              const PayNewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
