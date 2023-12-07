import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_sharp,
              color: AppColors.primaryColor,
              size: 64,
            ),
            Helper.hSizeBox(AppConst.globalPadding),
            Helper.showPaymentText(
                fontSize: 24, text: AppStrings.paymentSuccessful),
            Helper.hSizeBox(AppConst.globalSizeBox),
            Center(
              child: Helper.showPaymentText(
                  fontSize: 20, text: AppStrings.yourOrder),
            ),
            Helper.hSizeBox(AppConst.globalPadding),
            CommonButton(
              buttonText: AppStrings.continueShopping,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
