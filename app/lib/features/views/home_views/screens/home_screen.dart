import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/views/home_views/widgets/best_selling_list.dart';
import 'package:todo_app/features/views/home_views/widgets/feature_list.dart';
import 'package:todo_app/features/views/home_views/widgets/search_header.dart';
import 'package:todo_app/features/views/home_views/widgets/special_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConst.globalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchHeader(),
                Helper.showHeaderList(
                  header: AppStrings.specialForYou,
                ),
                const SpecialList(),
                Helper.showHeaderList(
                  header: AppStrings.featuredProduct,
                ),
                const FeaturedList(),
                Helper.showHeaderList(
                  header: AppStrings.bestSellingProduct,
                ),
                const BestSellingList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
