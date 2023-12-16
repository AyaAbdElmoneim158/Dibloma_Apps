import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_product_v_card.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class SpecialList extends StatelessWidget {
  const SpecialList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        var productCubit = ProductCubit.get(context);

        return SizedBox(
          height: AppConst.homeListViewHeight * 1.7,
          child: ListView.separated(
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
