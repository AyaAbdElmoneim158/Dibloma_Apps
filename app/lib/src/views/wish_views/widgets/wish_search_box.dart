import 'package:flutter/material.dart';
import '/core/shareable_components/common_field.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';

class WishSearchBox extends StatelessWidget {
  const WishSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonField(
      hintText: AppStrings.searchProduct,
      validator: (val) {
        return null;
      },
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.primaryColor,
      ),
    );
  }
}
