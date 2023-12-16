import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/src/views/category/widgets/category_search_box.dart';
import 'package:todo_app/src/views/category/widgets/products_grid.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.searchCategory),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          children: [
             CategorySearchBox(id: id ,isWork:  true),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            const ProductsGrid(),
          ],
        ),
      ),
    );
  }
}
