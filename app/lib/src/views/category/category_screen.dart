import 'package:flutter/material.dart';
import 'package:todo_app/src/views/category/widgets/categories_grid.dart';
import 'package:todo_app/src/views/category/widgets/category_search_box.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

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
            const CategorySearchBox(id: 1, isWork: false,), // Not has Functionality At Api
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            const CategoriesGrid(),
          ],
        ),
      ),
    );
  }
}
