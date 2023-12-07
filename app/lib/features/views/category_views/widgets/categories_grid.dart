import 'package:flutter/cupertino.dart';
import '/features/model/category_model.dart';
import '/core/shareable_components/common_category_card.dart';
import '/core/utils/styles.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: Styles.gridDelegateStyle(),
        physics: const BouncingScrollPhysics(),
        itemCount: dummyCategories .length,
        itemBuilder: (context, index) => CommonCategoryCard(
          category: dummyCategories[index],
        ),
      ),
    );
  }
}
