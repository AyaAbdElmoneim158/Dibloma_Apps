import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/shareable_components/common_circle_avatar.dart';
import '/core/shareable_components/common_field.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class SearchHeaderWithFilter extends StatelessWidget {
  const SearchHeaderWithFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CommonField(
            hintText: AppStrings.searchHere,
            validator: (val) {
              return null;
            },
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Helper.wSizeBox(AppConst.globalSizeBox),
        const CommonCircleAvatar(
          radius: 32,
          avatar: Icon(
            IconlyLight.filter,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}