import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/shareable_components/common_product_h_card.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:todo_app/src/controller/category_cubit/category_cubit.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is GetProductsByCategoryErrorState) {
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: "Error",
                message: state.error,
                contentType: ContentType.failure,
              ),
            );
          }
        },
        builder: (context, state) {
          var allProductByCategory =
              CategoryCubit.get(context).allProductByCategory;

          return state is GetProductsByCategoryLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is GetProductsByCategoryErrorState
                  ? Center(child: Text("Error State.....${state.error}"))
                  : state is GetProductsByCategorySuccessState
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: allProductByCategory.length,
                          separatorBuilder: (context, index) =>
                              Helper.hSizeBox(AppConst.globalPadding),
                          itemBuilder: (context, index) => CommonProductHCard(
                            product: allProductByCategory[index],
                          ),
                        )
                      : const SizedBox();
        },
      ),
    );
  }
}
