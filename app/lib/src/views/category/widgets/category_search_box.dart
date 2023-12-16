import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';
import '/core/shareable_components/common_field.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';

class CategorySearchBox extends StatelessWidget {
  const CategorySearchBox({
    super.key,
    required this.isWork,
    required this.id,
  });
  final int id;
  final bool isWork;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      var productCubit = ProductCubit.get(context);

      return CommonField(
        hintText: AppStrings.searchCategory,
        controller: controller,
        onChanged: (val) {
          if (isWork) {
            debugPrint("search box val:  $val");
            productCubit.filterProductByCategory(title: val, categoryId: id);
          }
        },
        radius: 32,
        validator: (val) {
          return null;
        },
        //ToD: onTap: () => Navigator.of(context).pushNamed(Routes.searchProductRoute, arguments: categoryId),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.primaryColor,
        ),
      );
    });
  }
}
