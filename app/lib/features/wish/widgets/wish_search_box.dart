import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class WishSearchBox extends StatelessWidget {
  const WishSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonField(
      hintText: 'Search Product',
      // headerField: ,
      validator: (val) {
        return null;
      },
      prefixIcon: const Icon(
        IconlyLight.search,
        color: AppColors.primaryColor,
      ),
    );
  }
}
