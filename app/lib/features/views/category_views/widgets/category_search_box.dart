import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class CategorySearchBox extends StatelessWidget {
  const CategorySearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonField(
      hintText: AppStrings.searchCategory,
      radius: 32,
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
