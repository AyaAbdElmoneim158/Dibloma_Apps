import 'package:flutter/material.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/category_views/widgets/categories_grid.dart';
import '/features/views/category_views/widgets/category_search_box.dart';

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
