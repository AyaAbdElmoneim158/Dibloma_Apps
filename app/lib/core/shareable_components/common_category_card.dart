import 'package:flutter/material.dart';
import 'package:todo_app/core/model/category_model.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/styles.dart';

class CommonCategoryCard extends StatelessWidget {
  const CommonCategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        AspectRatio(
          aspectRatio: AppConst.aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConst.globalRadius),
            child: Image.asset(
              category.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        AspectRatio(
          aspectRatio: AppConst.aspectRatio,
          child: Container(decoration: Styles.grayBoxDecorationStyle()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category.name,
            style: TextStyles.getCategoryNameStyle(),
          ),
        )
      ],
    );
  }
}
