import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/shareable_components/common_product_h_card.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';

class SearchedList extends StatelessWidget {
  const SearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      var productCubit = ProductCubit.get(context);

      return Expanded(
        child: (state is FilterProductsLoadingState)
            ? const Center(child: CircularProgressIndicator())
            : (state is FilterProductsErrorState)
                ? Center(child: Text("Error State.....${state.error}"))
                : (state is FilterProductsSuccessState)
                    ? ListView.separated(
                        separatorBuilder: (context, index) =>
                            Helper.hSizeBox(AppConst.globalSizeBox),
                        itemBuilder: (context, index) => CommonProductHCard(
                          product: productCubit.filterProducts[index],
                        ),
                        itemCount: productCubit.filterProducts.length,
                      )
                    : const Center(
                        child: Text("List is Empty"),
                      ),
      );
    });
  }
}
