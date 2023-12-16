import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';
import '/core/shareable_components/common_product_v_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var productCubit = ProductCubit.get(context);

        return SizedBox(
          height: AppConst.homeListViewHeight * 1.7,
          child: state is GetAllProductLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is GetAllProductErrorState
                  ? Center(
                      child: Column(
                      children: [
                        FittedBox(
                          child: Image.asset('assets/user_images/warning.png'),
                        ),
                        Text(state.error),
                      ],
                    ))
                  : state is GetAllProductSuccessState
                      ? const SizedBox()
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              Helper.wSizeBox(AppConst.globalSizeBox),
                          itemCount: productCubit.allProducts.length,
                          itemBuilder: (context, index) => CommonProductVCard(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, Routes.detailsProductRoute),
                            product: productCubit.allProducts[index],
                          ),
                        ),
        );
      },
    );
  }
}
