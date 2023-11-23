import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/category/widgets/categories_grid.dart';
import 'package:todo_app/features/category/widgets/category_search_box.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const CategorySearchBox(),
            Helper.hSizeBox(32),
            const CategoriesGrid(),
          ],
        ),
      ),
    );
  }
}
