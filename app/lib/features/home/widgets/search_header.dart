import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/helper.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CommonField(
            hintText: 'Search Product',
            // headerField: ,
            validator: (val) {
              return null;
            },
            prefixIcon:
                const Icon(IconlyLight.search, color: AppColors.primaryColor),
          ),
        ),
        Helper.wSizeBox(8),
        const CommonCircleAvatar(
            radius: 32,
            avatar: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            )),
        Helper.wSizeBox(8),
        const CommonCircleAvatar(
            radius: 32,
            avatar: Icon(
              IconlyBroken.notification,
              color: AppColors.primaryColor,
            )),
      ],
    );
  }
}
