import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.paymentImage, this.onTap});
  final String paymentImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.grayFontColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FancyShimmerImage(
            imageUrl: paymentImage,
            boxFit: BoxFit.fill,
            width: 130,
          ),
        ),
      ),
    );
  }
}
