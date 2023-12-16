import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';

class SearchHeaderWithFilter extends StatelessWidget {
  const SearchHeaderWithFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      var productCubit = ProductCubit.get(context);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CommonField(
              controller: controller,
              onChanged: (val) {
                debugPrint("search box val:  $val");
                productCubit.filterProductByTitle(title: val);
              },
              //
              vertical: 3,
              hintText: AppStrings.searchProduct,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Helper.wSizeBox(AppConst.globalSizeBox),
          CommonCircleAvatar(
            //ToD: open modelView to search
            onTap: () {},
            avatar: const Icon(
              IconlyBroken.filter,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      );
    });
  }
}
