import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/category/widgets/categories_grid.dart';
import 'package:todo_app/features/category/widgets/category_search_box.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.searchCategory),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          children: [
            const CategorySearchBox(),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            const CategoriesGrid(),
          ],
        ),
      ),
    );
  }
}
