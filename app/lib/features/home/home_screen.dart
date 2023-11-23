import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/model/category_model.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/shareable_components/common_category_card.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/shareable_components/common_product_v_card.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchHeader(),
                Helper.hSizeBox(32),
                Helper.showHeaderWithSeeMore(header: AppStrings.specialForYou),
                Helper.hSizeBox(18),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => Helper.wSizeBox(8),
                    itemCount: categories.length,
                    itemBuilder: (context, index) =>
                        CommonCategoryCard(category: categories[index]),
                  ),
                ),
                Helper.hSizeBox(18),
                Helper.showHeaderWithSeeMore(header: AppStrings.specialForYou),
                Helper.hSizeBox(18),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => Helper.wSizeBox(8),
                    itemCount: products.length,
                    itemBuilder: (context, index) => CommonProductVCard(
                      product: products[index],
                    ),
                  ),
                ),
                Helper.hSizeBox(18),
                Helper.showHeaderWithSeeMore(
                    header: AppStrings.bestSellingProduct),
                Helper.hSizeBox(18),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => Helper.wSizeBox(8),
                    itemCount: products.length,
                    itemBuilder: (context, index) => CommonProductVCard(
                      product: products[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CommonField(
            hintText: 'Search Product',
            // headerField: ,
            validator: (val) {
              return null;
            },
            prefixIcon:
                const Icon(IconlyLight.search, color: AppColors.primaryColor),
          ),
        ),
        Helper.wSizeBox(8),
        const CommonCircleAvatar(
            radius: 32,
            avatar: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            )),
        Helper.wSizeBox(8),
        const CommonCircleAvatar(
            radius: 32,
            avatar: Icon(
              IconlyBroken.notification,
              color: AppColors.primaryColor,
            )),
      ],
    );
  }
}
