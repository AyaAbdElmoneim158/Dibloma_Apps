import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/model/category_model.dart';
import 'package:todo_app/core/shareable_components/common_category_card.dart';
import 'package:todo_app/core/utils/styles.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: Styles.gridDelegateStyle(),
        itemCount: categories.length,
        itemBuilder: (context, index) => CommonCategoryCard(
          category: categories[index],
        ),
      ),
    );
  }
}
