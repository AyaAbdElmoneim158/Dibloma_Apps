import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_category_card.dart';
import 'package:todo_app/src/controller/category_cubit/category_cubit.dart';
import '/core/utils/styles.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        var allCategory = cubit.allCategory;

        return state is GetCategoriesLoadingState
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : state is GetCategoriesErrorState
                ? Expanded(child: Center(child: Text(state.error)))
                : state is GetCategoriesSuccessState
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate: Styles.gridDelegateStyle(),
                          physics: const BouncingScrollPhysics(),
                          itemCount: allCategory.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              // ToD: Call Here Or Not ..... cubit.getProductsByCategory
                              cubit.getProductsByCategory(
                                allCategory[index].id!,
                              );
                              Navigator.pushNamed(
                                context,
                                Routes.categoryProductsRoute,
                                arguments: allCategory[index].id,
                              );
                            },
                            child: CommonCategoryCard(
                              category: allCategory[index],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox();
      },
    );
  }
}
